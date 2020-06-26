class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :username
      t.string :series
      t.string :password_digest

      t.timestamps null: false
    end 
  end

end
