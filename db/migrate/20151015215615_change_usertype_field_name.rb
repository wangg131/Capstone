class Changeuser_typeFieldName < ActiveRecord::Migration
  def change
    rename_column :users, :user_type, :user_type 
  end
end
