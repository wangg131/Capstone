class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @north_neighborhoods = NORTH_SEATTLE_SELECT.each {|neighborhood| neighborhood}
    @central_neighborhoods = CENTRAL_SEATTLE_SELECT.each {|neighborhood| neighborhood}
    @south_neighborhoods = SOUTH_SEATTLE_SELECT.each {|neighborhood| neighborhood }
  end

  def create
    @profile = Profile.create(profile_params)
    redirect_to new_profile_path(@user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:title, :house_type, :description, {neighborhoods: []}, :rooms_needed, :bathroom_type, :min_price, :max_price, :cats, :dogs, :parking, :laundry, :max_roommates, :smoking, :gender_preference, :date_needed, :user_id)
  end
end
