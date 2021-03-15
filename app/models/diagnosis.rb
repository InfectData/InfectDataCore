class Diagnosis < ApplicationRecord
  has_many :cases
  has_many :reports, through: :cases
end
