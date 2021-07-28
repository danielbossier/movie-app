class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :plot, :english, :genres, :director, :user_id
end
