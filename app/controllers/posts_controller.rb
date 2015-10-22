class PostsController < ApplicationController
  def new
    @user = current_user
    @post = Post.new
    @neighborhoods = PROFILE_SEATTLE_SELECT.each {|neighborhood| neighborhood}
    @housing_types = HOUSING_TYPES
  end

  def create
    @user = current_user
    @post = Post.create(post_params)
    @user_id = params[:user_id]
    if @post.save
      @post.update_columns(user_id: @user_id)
      @user.update_columns(post_id: @post.id)
      # params[:images].each { |image| @post.create(image: image)}
      redirect_to user_path(@user.id)
    else
      @neighborhoods = SEATTLE_SELECT.each {|neighborhood| neighborhood}
      @housing_types = HOUSING_TYPES
      render :new
    end
  end

  def image_upload
    @user = current_user
    @uploader = Post.new.images
    # @uploader.update_attribute :key, params[:key]
    @uploader.success_action_redirect = new_user_post_path(@user.id)
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
    :smoking, :gender_preference, :user_id, :image)
  end
end
