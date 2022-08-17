# frozen_string_literal: true

class PerformingArtist < ApplicationRecord
  belongs_to :artist
  belongs_to :live

  validates :artist_id, uniqueness: { scope: :live_id }
end
