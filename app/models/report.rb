class Report < ApplicationRecord
  belongs_to :customer
  belongs_to :performing_artist
end
