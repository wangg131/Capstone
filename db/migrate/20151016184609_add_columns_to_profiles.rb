class AddColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :title, :text
    add_column :profiles, :house_type, :string
    add_column :profiles, :neighborhoods, :text
    add_column :profiles, :rooms_wanted, :integer
    add_column :profiles, :bathroom_type, :string
    add_column :profiles, :description, :text
    add_column :profiles, :min_price, :integer
    add_column :profiles, :max_price, :integer
    add_column :profiles, :cats, :boolean
    add_column :profiles, :dogs, :boolean
    add_column :profiles, :parking, :string
    add_column :profiles, :laundry, :string
    add_column :profiles, :max_roommates, :integer
    add_column :profiles, :smoking, :boolean
    add_column :profiles, :gender_preference, :string
    add_column :profiles, :date_needed, :string
    add_column :profiles, :seeker_id, :integer
  end
end
