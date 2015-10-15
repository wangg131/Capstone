class CreateSeekerBios < ActiveRecord::Migration
  def change
    create_table :seeker_bios do |t|

      t.timestamps null: false
    end
  end
end
