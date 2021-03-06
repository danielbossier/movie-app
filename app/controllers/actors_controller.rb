class ActorsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    actor = Actor.all
    render json: actor.as_json
  end

  def create
    actor = Actor.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      known_for: params["known_for"],
      gender: params["gender"],
      age: params["age"],
      movie_id: params["movie_id"],
    )
    if actor.save
      render json: actor
    else
      render json: { errors: actor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    actor_id = params["id"]
    actor = Actor.find(actor_id)
    render json: actor
  end

  def update
    actor_id = params["id"]
    actor = Actor.find_by(id: actor_id)
    actor.first_name = params["first_name"] || actor.first_name
    actor.last_name = params["last_name"] || actor.last_name
    actor.known_for = params["known_for"] || actor.known_for
    actor.gender = params["gender"] || actor.gender
    actor.age = params["age"] || actor.age
    actor.movie_id = params["movie_id"] || actor.movie_id

    if actor.save
      render json: actor
    else
      render json: { errors: actor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    actor_id = params["id"]
    actor = Actor.find_by(id: actor_id)
    actor.destroy
    render json: { message: "You have destroyed this record." }
  end
end
