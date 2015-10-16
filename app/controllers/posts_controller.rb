class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(create_params)
  end

  private

  def create_params
    params.require(:post).permit(:title, :house_type, :description, :neighborhood, :date_available, :rooms_available, :bathroom_type, :price, :cats, :dogs, :parking, :laundry, :total_roommates, :smoking, :gender_preference, :user_id, :image)
  end
end