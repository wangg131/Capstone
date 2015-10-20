class ChangeCol < ActiveRecord::Migration
  def change
    remove_column :posts, :image
    add_column :posts, :images, :text
  end
end
