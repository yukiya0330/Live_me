# frozen_string_literal: true

class LiveSchedule < ApplicationRecord
  belongs_to :live
  belongs_to :live_house

  validates :live_id, uniqueness: { scope: :live_house_id }
end
