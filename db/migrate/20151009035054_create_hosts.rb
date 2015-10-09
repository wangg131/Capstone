class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      
      t.timestamps null: false
    end
  end
end
