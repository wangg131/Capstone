class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(create_params)
  end



  private

  def create_params
    params.require(:post).permit(:name, :email, :password, :password_confirmation, :phone_number, :street, :city, :state, :zip, :user_type, :country_code, :authy_id)
  end





end
