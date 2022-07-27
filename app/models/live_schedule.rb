class LiveSchedule < ApplicationRecord
  belongs_to :live
  belongs_to :live_house
end
