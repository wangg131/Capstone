class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
       t.text    :title
       t.string  :house_type
       t.text    :neighborhoods
       t.integer :rooms_needed
       t.string  :bathroom_type
       t.text    :description
       t.integer :min_price
       t.integer :max_price
       t.boolean :cata
       t.boolean :dogs
       t.string  :parking
       t.string  :laundry
       t.integer :max_roommates
       t.boolean :smoking
       t.integer :user_id
    end
  end
end
