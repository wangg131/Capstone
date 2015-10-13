class SessionsController < ApplicationController
  def new; end

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

  def facebook_create
    auth_hash = request.env['omniauth.auth']
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  #
  #   begin
  #   @facebook_user = User.from_omniauth(request.env['omniauth.auth'])
  #   session[:user_id] = @facebook_user.id
  #   flash[:success] = "Welcome, #{@facebook_user.name}!"
  #   rescue
  #   flash[:warning] = "There was an error while trying to authenticate you..."
  #   end
  #
  # redirect_to root_path


  #   auth_hash = request.env['omniauth.auth'] || params
  #   @facebook_user = User.find_or_create_from_omniauth(auth_hash)
  #   session[:user_id] = @facebook_user.id
  # end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
