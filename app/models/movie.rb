class Movie < ApplicationRecord
  has_many :actors

  validates :title, length: { minimum: 2 }
  validates :plot, presence: true
  validates :year, numericality: { greater_than: 1850 }
  validates :director, length: { minimum: 2 }
  validates :english, presence: true
end
