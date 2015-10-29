class AddColumnsToTables < ActiveRecord::Migration
  def change
    add_column :messages, :created_at, :datetime
    add_column :messages, :updated_at, :datetime
    add_column :conversations, :created_at, :datetime
    add_column :conversations, :updated_at, :datetime
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
    add_column :posts, :created_at, :datetime
    add_column :posts, :updated_at, :datetime
    add_column :profiles, :created_at, :datetime
    add_column :profiles, :updated_at, :datetime
    add_column :matches, :created_at, :datetime
    add_column :matches, :updated_at, :datetime
    add_column :photos, :created_at, :datetime
    add_column :photos, :updated_at, :datetime
  end
end
