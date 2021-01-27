class AddStateToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :state
  end
end
