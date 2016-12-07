class CreateDrillImageCoordinates < ActiveRecord::Migration[5.0]
  def change
    create_table :drill_image_coordinates do |t|
      t.belongs_to :drill, foreign_key: true
      t.string :x
      t.string :y
      t.string :marker

      t.timestamps
    end
  end
end
