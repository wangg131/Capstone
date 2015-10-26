class ProfilesController < ApplicationController
  before_filter :current_user
  before_filter :neighborhoods_housetypes, only:[:new, :create]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
    neighborhoods_housetypes
  end

  def create
    @profile = Profile.create(profile_params)
    @user_id = session[:user_id]
    if @profile.save
      redirect_to user_path(@user.id)
    else
      neighborhoods_housetypes
      render :new
    end
  end

  def show
    session[:profile_id] = @user.profile.id
    @profile = Profile.find(session[:profile_id])
  end

  private

  def profile_params
    params.require(:profile).permit(:title, {house_type: []}, :description,
    {neighborhoods: []}, :rooms_needed, {bathroom_type: []}, :min_price,
    :max_price, :cats, :dogs, {parking: []}, {laundry: []}, :max_roommates,
    :smoking, :gender_preference, :date_needed, :user_id)
  end
end
