class RenameCatsColumnProfiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :cata, :cats
  end
end
