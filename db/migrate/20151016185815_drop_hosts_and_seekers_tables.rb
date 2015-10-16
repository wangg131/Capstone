class DropHostsAndSeekersTables < ActiveRecord::Migration
  def change
    drop_table :hosts
    drop_table :seekers
    rename_column :posts, :host_id, :user_id
    rename_column :profiles, :seeker_id, :user_id
    add_column :users, :post_id, :integer
    add_column :users, :profile_id, :integer
  end
end
