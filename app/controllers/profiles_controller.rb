class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @neighborhoods = PROFILE_SEATTLE_SELECT.each {|neighborhood| neighborhood}
    @housing_types = HOUSING_TYPES
  end

  def create
    @profile = Profile.create(profile_params)
    redirect_to new_profile_path(@user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:title, {house_type: []}, :description, {neighborhoods: []}, :rooms_needed, {bathroom_type: []}, :min_price, :max_price, :cats, :dogs, {parking: []}, {laundry: []}, :max_roommates, :smoking, :gender_preference, :date_needed, :user_id)
  end
end
