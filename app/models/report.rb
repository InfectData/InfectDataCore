class Report < ApplicationRecord
  belongs_to :district
  belongs_to :user
  belongs_to :diagnosis
  has_many :cases
end
