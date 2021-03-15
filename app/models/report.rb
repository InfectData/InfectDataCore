class Report < ApplicationRecord
  belongs_to :district
  belongs_to :user
  has_many :cases
  has_many :diagnosis, through: :cases
end
