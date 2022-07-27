class Artist < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorite_artists, dependent: :destroy
  has_many :artist_genres, dependent: :destroy
  has_many :performing_artists, dependent: :destroy
end
