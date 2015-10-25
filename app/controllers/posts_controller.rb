class PostsController < ApplicationController
  before_filter :current_user
  before_filter :neighborhoods_housetypes, only:[:new, :create]

  def index
    @posts = Post.all
    # session[:post_id] = @user.post.id
    # @post = Post.find(session[:post_id])
    # @photos = @post.photos.all
  end

  def new
    @post = Post.new
    @photo = @post.photos.build
    neighborhoods_housetypes
  end

  def create
    @post = Post.new(post_params)
    @user_id = session[:user_id]
    if @post.save
      params[:photos]['images'].each do |a|
        @photo = @post.photos.create!(images: a)
        # update_columns(images: image_url.original_filename)
        # @post.images << image_url.original_filename
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

  # def update
  #   if @post.update(params[:post].permit(:title,:description))
  #     # to handle multiple images upload on update when user adds more photos
  #     if params[:images]
  #       params[:images].each { |image|
  #         @post.photos.create(image: image)
  #       }
  #     end
  #     flash[:notice] = "Post has been updated."
  #     redirect_to rootpath
  #   else
  #     render :edit
  #   end
  # end

  private

  def post_params
    params.require(:post).permit(:title, :house_type, :description, :neighborhood, :date_available,
    :rooms_available, :bathroom_type, :price, :cats, :dogs, :parking, :laundry, :total_roommates,
    :smoking, :gender_preference, :user_id, {photos_attributes: [:id, :post_id, :images]})
  end
end
