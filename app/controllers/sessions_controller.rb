class SessionsController < ApplicationController
  def new; end

  def create #logging in
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to account_path(@user.id)
    else
      flash.now[:login_error] = "Incorrect password. Try Again."
      render :new
    end
  end

  def facebook_user?
   provider != nil && uid != nil
  end

  def facebook_create
    auth_hash = request.env['omniauth.auth']
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
