class ActorsController < ApplicationController
  def display_actor
    actor = Actor.all
    render json: actor.as_json
  end

  def single_actor
    input_value = params["select"]
    render json: { message: "#{input_value}" }
  end
end
