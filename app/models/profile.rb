class Profile < ActiveRecord::Base
  belongs_to :user
  validates_numericality_of :min_price, :max_price, :rooms_needed, :total_roommates,
  :max_roommates, only_integer: true
  #validates_presence_of :title :house_type :description,:neighborhoods, :rooms_needed, :bathroom_type.,
  # :min_price, :max_price, :cats, :dogs, :parking, :laundry, :max_roommates, :smoking,
  # :gender_preference, :date_needed)
end
