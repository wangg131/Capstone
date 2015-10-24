class Post < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :matches
  accepts_nested_attributes_for :photos
  # validates_numericality_of :price, :rooms_available, :total_roommates, only_integer: true
  # validates_presence_of :title, :house_type, :description, :neighborhood, :date_available,
  # :rooms_available, :bathroom_type, :price, :cats, :dogs, :parking, :laundry, :total_roommates,
  # :smoking, :gender_preference, :image
end
