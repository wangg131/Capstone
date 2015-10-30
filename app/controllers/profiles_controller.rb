require 'json'

class ProfilesController < ApplicationController
  before_filter :current_user
  before_filter :neighborhoods_housetypes, only:[:new, :create, :edit]

  def index
    @profiles = Profile.where(cats: @user.post.cats)
                 .where(dogs: @user.post.dogs)
                 .where(smoking: @user.post.smoking)
                 .where("rooms_needed <= ?", @user.post.rooms_available)
                 .where("max_roommates >= ?", @user.post.total_roommates)
                 .where("min_price <= ?", @user.post.price)
                 .where("max_price >= ?", @user.post.price)
                 .where("neighborhoods LIKE ?", "%#{@user.post.neighborhood}%")
                 .where("laundry LIKE ?", "%#{@user.post.laundry}%")
                 .where("parking LIKE ?", "%#{@user.post.parking}%")
                 .where("bathroom_type LIKE ?", "%#{@user.post.bathroom_type}%")
                 .where("house_type LIKE ?", "%#{@user.post.house_type}%")

  end

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.create(profile_params)
    profile.neighborhoods = profile_params[:neighborhoods].to_json
    profile.laundry = profile_params[:laundry].to_json
    profile.parking = profile_params[:parking].to_json
    profile.bathroom_type = profile_params[:bathroom_type].to_json
    profile.house_type = profile_params[:house_type].to_json
    @user_id = session[:user_id]
    if profile.save
      redirect_to user_path(@user.id)
    else
      neighborhoods_housetypes
      render :new
    end
  end

  def show
    user = User.find(params[:id])
    @profile = user.profile
  end

  def edit
    session[:profile_id] = @user.profile.id
    @profile = Profile.find(session[:profile_id])
  end

  def update
    session[:profile_id] = @user.profile.id
    @profile = Profile.find(session[:profile_id])
    if @profile.save
      @profile.update(profile_params)
      redirect_to profile_path(@user.id)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:title, {house_type: []}, :description,
    {neighborhoods: []}, :rooms_needed, {bathroom_type: []}, :min_price,
    :max_price, :cats, :dogs, {parking: []}, {laundry: []}, :max_roommates,
    :smoking, :gender_preference, :date_needed, :user_id)
  end
end
