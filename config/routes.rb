Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/display_actor" => "actors#display_actor"

  get "/all_movies" => "movies#all_movies"

  get "/first_movie" => "movies#first_movie"

  get "single_actor/:select" => "movies#single_actor"
end
