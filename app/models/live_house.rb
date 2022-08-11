class LiveHouse < ApplicationRecord
  has_many :live_schedules, dependent: :destroy
  has_many :lives, through: :live_schedules
  
  has_one_attached :house_image
  
  enum status: { release: 0, not_release: 1, close: 2 }
  
  with_options presence: true do
    validates :name, uniqueness: true
    validates :introduction
    validates :postal_code, length: { is: 7 }
    validates :address
  end 
  validates :status, inclusion: { in: LiveHouse.statuses.keys }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
    
  def get_house_image(width, height)
    unless house_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      house_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    house_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      LiveHouse.where(name: content)
    elsif method == 'forward'
      LiveHouse.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      LiveHouse.where('name LIKE ?', '%' + content)
    else
      LiveHouse.where('name LIKE ?', '%' + content + '%')
    end
  end  
  
  
end
