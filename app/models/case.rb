class Case < ApplicationRecord
  belongs_to :user
  belongs_to :diagnosis
  belongs_to :district

  scope :unconfirmed, -> { where(confirmed_at: nil) }
  scope :confirmed, -> { where.not(confirmed_at: nil) }
  
end
