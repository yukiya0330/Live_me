# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :customer
  belongs_to :live

  has_one_attached :report_image

  with_options presence: true do
    validates :customer_id
    validates :live_id
    validates :comment
  end

  def get_report_image(width, height)
    unless report_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      report_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    report_image.variant(resize_to_limit: [width, height]).processed
  end
end
