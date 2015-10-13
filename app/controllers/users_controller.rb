class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(create_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Try again, account was not created."
      render :new
    end
  end

  private

  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :street, :city, :state, :zip)
  end

end
