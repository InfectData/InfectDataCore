class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :titel
      t.string :abbr

      t.timestamps
    end
  end
end
