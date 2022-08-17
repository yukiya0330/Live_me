# frozen_string_literal: true

class FavoriteArtist < ApplicationRecord
  belongs_to :customer
  belongs_to :artist
end
