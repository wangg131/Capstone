class Post < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :matches
  accepts_nested_attributes_for :photos
  # validates_numericality_of :price, :rooms_available, :total_roommates, only_integer: true
  # validates_presence_of :title, :house_type, :description, :neighborhood, :date_available,
  # :rooms_available, :bathroom_type, :price, :cats, :dogs, :parking, :laundry, :total_roommates,
  # :smoking, :gender_preference, :image

# scope :diff, -> { select(:ingredients).distinct.order(:ingredients).pluck(:ingredients) }

# 
# scope :compatible_posts, -> {where(cats: @profile.cats ).where(dogs: @profile.dogs).where(smoking: @profile.smoking).where("rooms_available >= ?", @profile.rooms_needed).where("total_roommates <= ?", @profile.max_roommates).where("price BETWEEN ?,?", @profile.min_price, @profile.max_price).where(neighborhood: params[:neighborhoods]).where(house_type: params[:house_type]).where(bathroom_type: params[:bathroom_type]).where(laundry: params[:laundry]).where(parking: params[:parking])}
#   @profile = Profile.find(session[:user_id])

end
