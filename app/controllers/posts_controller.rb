class PostsController < ApplicationController
  def new
    @post = Post.new
    @neighborhoods = PROFILE_SEATTLE_SELECT.each {|neighborhood| neighborhood}
    @housing_types = HOUSING_TYPES
  end

  def create
    @post = Post.create(post_params)
    @user_id = params[:user_id]
    if @post.save
      @post.user_id = @user_id
      @user.post_id = @post.id
      @post.save
    end
    redirect_to user_path(@user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :house_type, :description, :neighborhood, :date_available,
    :rooms_available, :bathroom_type, :price, :cats, :dogs, :parking, :laundry, :total_roommates,
    :smoking, :gender_preference, :user_id, :image)
  end
end
