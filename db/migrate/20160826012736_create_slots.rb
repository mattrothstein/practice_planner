class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots do |t|
      t.belongs_to :practice, foreign_key: true
      t.integer :length
      t.timestamps
    end
  end
end
