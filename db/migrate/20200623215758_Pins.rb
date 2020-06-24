class Pins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :artist
      t.string :owner_id
      t.string :series
      t.integer :price
    end 
  end
end
