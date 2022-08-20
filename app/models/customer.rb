# frozen_string_literal: true

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
  has_many :artists, through: :favorite_artists
  has_many :genres, through: :favorite_genres

  has_one_attached :profile_image

  validates :name, presence: true
  validates :nickname, presence: true
  validates :is_deleted, inclusion: { in: [true, false] }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/profile.png")
      profile_image.attach(io: File.open(file_path), filename: "default-image.png", content_type: "image/png")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.search_for(content, method)
    if method == "perfect"
      Customer.where(name: content)
    elsif method == "forward"
      Customer.where("name LIKE ?", content + "%")
    elsif method == "backward"
      Customer.where("name LIKE ?", "%" + content)
    else
      Customer.where("name LIKE ?", "%" + content + "%")
    end
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲスト"
      customer.nickname = "guest"
    end
  end
end
