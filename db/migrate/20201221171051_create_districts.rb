class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :place
      t.integer :postal_code

      t.timestamps
    end
  end
end
