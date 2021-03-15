class AddDiagnsisToReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :diagnosis
  end
end
