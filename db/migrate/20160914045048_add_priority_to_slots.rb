class AddPriorityToSlots < ActiveRecord::Migration[5.0]
  def change
    add_column :slots, :priority, :integer
  end
end
