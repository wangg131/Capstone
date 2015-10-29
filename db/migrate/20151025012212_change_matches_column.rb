class ChangeMatchesColumn < ActiveRecord::Migration
  def change
    rename_column :matches, :approved?, :host_approved_seeker?
    add_column :matches, :seeker_approved_host?, :boolean
  end
end
