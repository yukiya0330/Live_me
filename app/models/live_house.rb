class LiveHouse < ApplicationRecord
  has_many :live_schedules, dependent: :destroy
  has_many :lives, through: :live_schedules
  
  has_one_attached :house_image
  
  enum status: { release: 0, not_release: 1, close: 2 }
    
  def get_house_image(width, height)
    unless house_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      house_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    house_image.variant(resize_to_limit: [width, height]).processed
  end
end
