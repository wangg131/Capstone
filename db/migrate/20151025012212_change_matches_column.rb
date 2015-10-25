class ChangeMatchesColumn < ActiveRecord::Migration
  def change
    rename_column :matches, :approved?, :host_approved?
    add_column :matches, :seeker_approved?, :boolean
  end
end
