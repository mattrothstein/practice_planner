class User < ApplicationRecord
  has_secure_password
  has_many :teams
  has_many :practices
  has_many :drills
end
