class Genre < ApplicationRecord
  has_many :favorite_genres, dependent: :destroy
  has_many :artist_genres, dependent: :destroy
end
