class MovieGenresController < ApplicationController
  def create
    movie_genre = MovieGenre.new(
      movie_id: params[:movie_id],
      genre_id: params[:genre_id],
    )
    if movie_genre.save
      render json: movie_genre
    else
      render json: { errors: movie_genre.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    movie_genres = MovieGenre.all
    render json: movie_genres.as_json
  end
end
