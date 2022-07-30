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
  has_many :lives, through: :reports
  
  has_one_attached :profile_image
    
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/profile.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
