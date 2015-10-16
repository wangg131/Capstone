class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(create_params)
  end

  private

  def create_params
    params.require(:post).permit(:title, :house_type, :description, :neighborhoods, :rooms_needed, :bathroom_type, :min_price, :max_price, :cats, :dogs, :parking, :laundry, :max_roommates, :smoking, :gender_preference, :date_needed, :user_id)
  end
end
