class Drill < ApplicationRecord
  belongs_to :user
  has_many :drill_image_coordinates
end
