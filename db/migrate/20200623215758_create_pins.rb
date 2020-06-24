class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :artist
      t.integer :owner_id
      t.string :series
      t.float :price
    end 
  end
end
