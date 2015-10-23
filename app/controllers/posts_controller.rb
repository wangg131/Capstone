class PostsController < ApplicationController
  before_filter :current_user
  before_filter :neighborhoods_housetypes, only:[:new, :create]

  def new
    @post = Post.new
    neighborhoods_housetypes
  end

  def create
    @post = Post.create(post_params)
    @user_id = session[:user_id]
    if @post.save
      redirect_to user_path(@user.id)
    else
      neighborhoods_housetypes
      render :new
    end
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
    :smoking, :gender_preference, :user_id, {images: []})
  end
end
