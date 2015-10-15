class CreateHousingPosts < ActiveRecord::Migration
  def change
    create_table :housing_posts do |t|

      t.timestamps null: false
    end
  end
end
