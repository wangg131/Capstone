class AddVerifiedColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verified, :boolean
  end
end
