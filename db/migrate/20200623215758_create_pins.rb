class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :name
      t.string :artist
      t.integer :user_id
      t.string :series
      t.float :price

      t.timestamps null: false
    end 
  end
end
