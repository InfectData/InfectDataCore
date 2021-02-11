class Case < ApplicationRecord
  before_create :set_pseud
  belongs_to :user
  belongs_to :diagnosis
  belongs_to :district
  belongs_to :report, optional: true

  scope :unconfirmed, -> { where(confirmed_at: nil) }
  scope :confirmed, -> { where.not(confirmed_at: nil) }

  private

  def set_pseud
    self.pseud = "#{first_name[2]}#{first_name.length}#{last_name[2]}#{last_name.length}"
  end

end
