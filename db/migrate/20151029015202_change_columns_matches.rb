class ChangeColumnsMatches < ActiveRecord::Migration
  def change
    rename_column :matches, :host_approved?, :host_approved_seeker?
    rename_column :matches, :seeker_approved?, :seeker_approved_host?
  end
end
