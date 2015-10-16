class ChangeColumnsInPosts < ActiveRecord::Migration
  def change
    change_column :posts, :date_available, :string
    add_column    :posts, :rooms_available, :integer
    add_column    :posts, :bathroom_type, :string
    remove_column :posts, :num_rooms, :integer
    remove_column :posts, :num_bathrooms, :integer
  end
end
