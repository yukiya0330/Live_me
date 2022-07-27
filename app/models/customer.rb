class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :favorite_artists, dependent: :destroy
  has_many :favorite_genres, dependent: :destroy
  has_many :bookmark_lives, dependent: :destroy
  
end
