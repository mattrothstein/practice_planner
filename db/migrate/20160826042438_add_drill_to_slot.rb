class AddDrillToSlot < ActiveRecord::Migration[5.0]
  def change
    add_reference :slots, :drill, foreign_key: true
  end
end