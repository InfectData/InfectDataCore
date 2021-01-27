class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.references :district
      t.text :comment
      t.datetime :date
      t.references :user

      t.timestamps
    end
  end
end
