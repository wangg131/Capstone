class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(create_params)

    if @user.save
      session[:user_id] = @user.id
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)
      # redirect_to account_path
      redirect_to root_path
    else
      flash.now[:error] = "Try again, account was not created."
      render :new
    end
  end

  private

  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :street, :city, :state, :zip, :usertype, :country_code, :authy_id)
  end

end
