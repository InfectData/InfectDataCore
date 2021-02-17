class State < ApplicationRecord
  has_many :districts
  has_many :users
  has_many :cases, through: :districts 
end
