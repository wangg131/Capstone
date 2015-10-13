class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:login_error] = "Incorrect password. Try Again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
