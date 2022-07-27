class LiveHouse < ApplicationRecord
  has_many :live_schedules, dependent: :destroy
  
  has_one_attached :live_house_image
    
  def get_live_house_image(width, height)
    unless live_house_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      live_house_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    live_house_image.variant(resize_to_limit: [width, height]).processed
  end
end
