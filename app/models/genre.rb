class Genre < ApplicationRecord
  has_many :favorite_genres, dependent: :destroy
  has_many :artist_genres, dependent: :destroy
  has_many :artists, through: :artist_genres

  validates :name, presence: true, uniqueness: true
  
  def favorited_by?(customer)
    favorite_genres.where(customer_id: customer.id).exists?
  end
end
