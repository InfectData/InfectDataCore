class Case < ApplicationRecord
  belongs_to :user
  belongs_to :diagnosis
end
