class District < ApplicationRecord
  has_many :users
  has_many :cases
  belongs_to :state
end
