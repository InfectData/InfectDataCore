class AddDistrictToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :district
  end
end
