class ChangeAddRemoveColumns < ActiveRecord::Migration
  def change
    rename_column :posts, :lease_length, :title
    rename_column :profiles, :rooms_wanted, :rooms_needed
  end
end
