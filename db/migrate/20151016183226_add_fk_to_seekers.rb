class AddFkToSeekers < ActiveRecord::Migration
  def change
    add_column :seekers, :profile_id, :integer
  end
end
