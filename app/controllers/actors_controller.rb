class ActorsController < ApplicationController
  def display_actor
    actor = Actor.all
    render json: actor.as_json
  end
end
