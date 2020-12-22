class AddDiagnosisToCase < ActiveRecord::Migration[6.0]
  def change
    add_reference :cases, :diagnosis
  end
end
