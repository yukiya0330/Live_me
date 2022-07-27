class Live < ApplicationRecord
  has_many :bookmark_lives , dependent: :destroy
  has_many :performing_artists, dependent: :destroy
  has_many :live_schedules, dependent: :destroy
end
