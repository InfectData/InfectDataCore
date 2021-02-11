class AddPseudToCases < ActiveRecord::Migration[6.0]
  def change
    add_column :cases, :pseud, :string
    add_index :cases, :pseud
  end
end
