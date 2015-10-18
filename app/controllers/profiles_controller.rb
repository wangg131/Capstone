class ProfilesController < ApplicationController

  CENTRAL_SEATTLE_SELECT = [["Magnolia/Interbay", "Magnolia/Interbay"],["Queen Anne", "Queen Anne"],
  ["South Lake Union", "South Lake Union"], ["Montlake/Eastlake", "Montlake/Eastlake"],
  ["Madison Park/Madison Valley", "Madison Park/Madison Valley"],
  ["Madrona/Leschi", "Madrona/Leschi"], ["First Hill", "First Hill"], ["Capitol Hill", "Capitol Hill"],
  ["Central District", "Central District"], ["International District", "International District"],
  ["Belltown/Denny Triangle/Downtown", "Belltown/Denny Triangle/Downtown"], ["Pioneer Square", "Pioneer Square"]]

  def new
    @profile = Profile.new
    @central_neighborhoods = CENTRAL_SEATTLE_SELECT.each {|neighborhood| neighborhood}
  end

  def create
    @profile = Profile.create(profile_params)
    redirect_to new_profile_path(@user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:title, :house_type, :description, :neighborhoods, :rooms_needed, :bathroom_type,
    :min_price, :max_price, :cats, :dogs, :parking, :laundry, :max_roommates, :smoking, :gender_preference,
    :date_needed, :user_id)
  end
end
