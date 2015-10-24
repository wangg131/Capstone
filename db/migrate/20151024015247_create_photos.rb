class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :post_id
      t.text :images

      t.timestamps null: false
    end
  end
end
