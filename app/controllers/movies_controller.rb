class MoviesController < ApplicationController
  def index
    movie = Movie.all
    render json: movie.as_json
  end

  def create
    movie = Movie.new(
      title: params["title"],
      year: params["year"],
      plot: params["plot"],
    )
    movie.save
    render json: movie
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
    movie.save
    render json: movie
  end

  def destroy
    movie_id = params["id"]
    movie = Movie.find_by(id: movie_id)
    movie.destroy
    render json: { message: "You have destroyed this record." }
  end
end
