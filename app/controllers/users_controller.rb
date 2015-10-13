class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(create_params)
  end

  private

  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :street, :city, :state, :zip)
  end

end
