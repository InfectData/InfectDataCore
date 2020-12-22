class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthdate
      t.string :place_of_residence
      t.string :diagnosis
      t.references :user
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
