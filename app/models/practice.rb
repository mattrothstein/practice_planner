class Practice < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_many :slots
end
