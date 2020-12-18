class AddDiagnosisToCase < ActiveRecord::Migration[6.0]
  def change
    add_reference :cases, :diagnosis, null: false, foreign_key: true
  end
end
