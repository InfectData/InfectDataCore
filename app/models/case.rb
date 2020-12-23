class Case < ApplicationRecord
  belongs_to :user
  belongs_to :diagnosis
  belongs_to :district
end
