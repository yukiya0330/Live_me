# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorite_artists, dependent: :destroy
  has_many :artist_genres, dependent: :destroy
  has_many :performing_artists, dependent: :destroy
  has_many :genres, through: :artist_genres
  has_many :lives, through: :performing_artists
  has_many :customers, through: :favorite_artists

  has_one_attached :artist_image

  enum status: { wait: 0, release: 1, not_release: 2 }

  with_options presence: true do
    validates :name, uniqueness: true
    validates :introduction
  end
  validates :status, inclusion: { in: Artist.statuses.keys }

  def get_artist_image(width, height)
    unless artist_image.attached?
      file_path = Rails.root.join("app/assets/images/artist.jpg")
      artist_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    artist_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(customer)
    favorite_artists.where(customer_id: customer.id).exists?
  end
  
  ransacker :favorite_count do
    query = '(SELECT COUNT(favorite_artists.artist_id) 
              FROM favorite_artists 
              where favorite_artists.artist_id = artists.id 
              GROUP BY favorite_artists.artist_id)'
    Arel.sql(query)
  end
  
  ransacker :comment_count do
    query = '(SELECT COUNT(comments.artist_id) 
              FROM comments 
              where comments.artist_id = artists.id 
              GROUP BY comments.artist_id)'
    Arel.sql(query)
  end
  
end
