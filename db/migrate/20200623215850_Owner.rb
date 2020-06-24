class Owner < ActiveRecord::Migration
  def change
    create_table :owner do |t|
      t.string :name
      t.string :pins
      t.string :series
    end 
  end
end
