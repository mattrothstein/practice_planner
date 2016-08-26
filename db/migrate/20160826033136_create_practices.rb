class CreatePractices < ActiveRecord::Migration[5.0]
  def change
    create_table :practices do |t|
      t.belongs_to :team, foreign_key: true
      t.datetime :date
      t.string :name
      t.text :notes
      t.integer :length
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
