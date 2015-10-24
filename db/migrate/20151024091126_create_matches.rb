class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :post_id
      t.integer :profile_id
      t.boolean :approved?

      t.timestamps null: false
    end
  end
end
