class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :cases, :created_at, true
  end
end
