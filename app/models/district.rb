class District < ApplicationRecord
  has_many :users
  has_many :cases
end
