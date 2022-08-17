# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :artist

  with_options presence: true do
    validates :customer_id
    validates :artist_id
    validates :comment
  end
end
