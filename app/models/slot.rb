class Slot < ApplicationRecord
  belongs_to :practice
  has_one :drill
end
