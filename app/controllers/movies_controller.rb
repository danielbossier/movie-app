class MoviesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    movie = Movie.all
    movie = Movie.where("english = ?", true)
    render json: movie.as_json
  end

  def create
    movie = Movie.new(
      title: params["title"],
      year: params["year"],
      plot: params["plot"],
      director: params["director"],
      english: params["english"],
      user_id: current_user.id,
    )
    if movie.save
      render json: movie.as_json
    else
      render json: { errors: movie.errors.full_messages },
             status: 422
    end
  end

  def show
    movie_id = params["id"]
    movie = Movie.find(movie_id)
    render json: movie
  end

  def update
    movie_id = params["id"]
    movie = Movie.find_by(id: movie_id)
    movie.title = params["title"] || movie.title
    movie.year = params["year"] || movie.year
    movie.plot = params["plot"] || movie.plot
    movie.director = params["director"] || movie.director
    movie.english = params["english"] || movie.english
    if movie.save
      render json: movie
    else
      render json: { errors: movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    movie_id = params["id"]
    movie = Movie.find_by(id: movie_id)
    movie.destroy
    render json: { message: "You have destroyed this record." }
  end
end
