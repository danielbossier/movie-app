class Actor < ApplicationRecord
  def display_actor
    actor = Actor.all
    render json: actor.as_json
  end
end
