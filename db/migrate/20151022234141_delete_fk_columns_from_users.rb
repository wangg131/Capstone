class DeleteFkColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :post_id
    remove_column :users, :profile_id
  end
end
