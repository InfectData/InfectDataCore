class AddStateToDistrict < ActiveRecord::Migration[6.0]
  def change
    add_reference :district, :state
  end
end
