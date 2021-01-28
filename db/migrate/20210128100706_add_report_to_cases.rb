class AddReportToCases < ActiveRecord::Migration[6.0]
  def change
    add_reference :cases, :report
  end
end
