class Live < ApplicationRecord
  has_many :bookmark_lives , dependent: :destroy
  has_many :performing_artists, dependent: :destroy
  has_many :live_schedules, dependent: :destroy
  
  has_one_attached :live_image
    
  def get_live_image(width, height)
    unless live_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      live_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    live_image.variant(resize_to_limit: [width, height]).processed
  end
end
