# frozen_string_literal: true

class BookmarkLive < ApplicationRecord
  belongs_to :customer
  belongs_to :live
end
