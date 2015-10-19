class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @neighborhoods = PROFILE_SEATTLE_SELECT.each {|neighborhood| neighborhood}
    @housing_types = HOUSING_TYPES
  end

  def create
    @profile = Profile.create(profile_params)
    @user_id = params[:user_id]
    if @profile.save
      @profile.update_columns(user_id: @user_id)
      @user.update_columns(profile_id: @profile.id)
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:title, {house_type: []}, :description, {neighborhoods: []},
    :rooms_needed, {bathroom_type: []}, :min_price, :max_price, :cats, :dogs, {parking: []},
    {laundry: []}, :max_roommates, :smoking, :gender_preference, :date_needed, :user_id)
  end
end
