class LiveHouse < ApplicationRecord
  has_many :live_schedules, dependent: :destroy
end
