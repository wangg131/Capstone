class RemoveColumnToUsersAgain < ActiveRecord::Migration
  def change
    remove_column :posts, :host_id
    remove_column :profiles, :seeker_id
  end
end
