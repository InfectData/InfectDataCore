class AddDistrictToCase < ActiveRecord::Migration[6.0]
  def change
    add_reference :cases, :district
  end
end
