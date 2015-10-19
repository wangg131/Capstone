class Post < ActiveRecord::Base
  belongs_to :user
  validates :price, :rooms_available, :total_roommates, numericality: { only_integer: true }
end
