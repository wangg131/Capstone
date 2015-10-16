class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :house_type, :string
    add_column :posts, :num_rooms, :integer
    add_column :posts, :num_bathrooms, :integer
    add_column :posts, :description, :text
    add_column :posts, :price, :integer
    add_column :posts, :neighborhood, :string
    add_column :posts, :lease_length, :string
    add_column :posts, :date_available, :datetime
    add_column :posts, :gender_preference, :string
    add_column :posts, :cats, :boolean
    add_column :posts, :dogs, :boolean
    add_column :posts, :smoking, :boolean
    add_column :posts, :image, :string
    add_column :posts, :total_roommates, :integer
    add_column :posts, :host_id, :integer
    add_column :posts, :parking, :string
    add_column :posts, :laundry, :string
  end
end
