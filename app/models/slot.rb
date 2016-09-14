class Slot < ApplicationRecord
  belongs_to :practice
  has_one :drill
  
  default_scope { order("priority ASC") }
end
