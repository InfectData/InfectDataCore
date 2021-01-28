class District < ApplicationRecord
  has_many :users
  has_many :cases
  has_many :reports
  belongs_to :state
end
