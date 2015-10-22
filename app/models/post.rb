class Post < ActiveRecord::Base
  belongs_to :user
#  validates_numericality_of :price, :rooms_available, :total_roommates, only_integer: true
  #validates_presence_of :title, :house_type, :description, :neighborhood, :date_available,
  # :rooms_available, :bathroom_type, :price, :cats, :dogs, :parking, :laundry, :total_roommates,
  # :smoking, :gender_preference, :image

  # Mounted Objects -----------------------
  mount_uploader :images, ImageUploader
end
