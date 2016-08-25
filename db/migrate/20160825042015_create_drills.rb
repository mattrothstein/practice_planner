class CreateDrills < ActiveRecord::Migration[5.0]
  def change
    create_table :drills do |t|
      t.string :name
      t.text :notes
      t.string :sport
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
