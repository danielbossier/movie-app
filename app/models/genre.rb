class Genre < ApplicationRecord
  has many :movie_genres
  has many :movies, through: :movie_genres
end
