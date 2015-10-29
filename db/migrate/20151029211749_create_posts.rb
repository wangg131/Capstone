class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :house_type
       t.text    :description
       t.integer :price
       t.string  :neighborhood
       t.string  :title
       t.string  :date_available
       t.string  :gender_preference
       t.boolean :cats
       t.boolean :dogs
       t.boolean :smoking
       t.integer :total_roommates
       t.string  :parking
       t.string  :laundry
       t.integer :rooms_available
       t.string  :bathroom_type
       t.text    :images
       t.integer :user_id
    end
  end
end
