require 'json'
class PostsController < ApplicationController
  before_filter :current_user
  before_filter :neighborhoods_housetypes, only:[:new, :create]

  def index
    neighborhoods_array = JSON.parse(@user.profile.neighborhoods)
    laundry_array = JSON.parse(@user.profile.laundry)
    parking_array = JSON.parse(@user.profile.parking)
    bathroom_array = JSON.parse(@user.profile.bathroom_type)
    house_type_array = JSON.parse(@user.profile.house_type)
    @posts = Post.where(cats: @user.profile.cats)
                 .where(dogs: @user.profile.dogs)
                 .where(smoking: @user.profile.smoking)
                 .where("rooms_available >= ?", @user.profile.rooms_needed)
                 .where("total_roommates <= ?", @user.profile.max_roommates)
                 .where("price BETWEEN ? AND ?", @user.profile.min_price, @user.profile.max_price)
                 .where(neighborhood: neighborhoods_array)
                 .where(laundry: laundry_array)
                 .where(parking: parking_array)
                 .where(bathroom_type: bathroom_array)
                 .where(house_type: house_type_array)

  end

  def new
    @post = Post.new
    @photo = @post.photos.build
    neighborhoods_housetypes
  end

  def create
    post = Post.new(post_params)
    if post.save
      params[:photos]['images'].each do |a|
        @photo = post.photos.create!(images: a)
      end
      redirect_to user_path(@user.id)
    else
      neighborhoods_housetypes
      render :new
    end
  end

  def show
    session[:post_id] = @user.post.id
    @post = Post.find(session[:post_id])
    @photos = @post.photos.all
  end

  def edit
    neighborhoods_housetypes
    session[:profile_id] = @user.post.id
    @post = Post.find(session[:post_id])
  end

  def update
    session[:profile_id] = @user.post.id
    @post = Post.find(session[:post_id])
    if @post.update(params[:post].permit(:title,:description, :house_type, :neighborhood, :rooms_available, :bathroom_type, :price, :cats, :dogs, :parking, :laundry, :total_roommates, :smoking))
raise
    # if @post.update(params[:post].permit(:title,:description))
      # to handle multiple images upload on update when user adds more photos
      if params[:images]
        params[:images].each { |image|
          @post.photos.create(image: image)
        }
      end
      flash[:notice] = "Post has been updated."
      redirect_to my_post_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :house_type, :description, :neighborhood, :date_available,
    :rooms_available, :bathroom_type, :price, :cats, :dogs, :parking, :laundry, :total_roommates,
    :smoking, :gender_preference, :user_id, :images, {photos_attributes: [:id, :post_id, :images]})
  end
end
