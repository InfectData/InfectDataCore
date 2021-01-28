class Report < ApplicationRecord
  belongs_to :district
  belongs_to :user
  has_many :cases
end
