class State < ApplicationRecord
  has_many :districts
  has_many :users
  has_many :cases, through: :districts

  default_scope { order(titel: :asc) }

  def total_cases(date = Date.today, diagnosis_id)
    @reports = Report.where(district_id: district_ids, diagnosis_id: diagnosis_id, date: date)
    @total_cases = @reports.map{|r| r.cases.count}.sum
    @total_cases
  end

  def district_ids
    districts.map{|district| district.id}
  end
end
