class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:pre_2fa_auth_user_id] = @user.id
      Authy::API.request_sms(id: @user.authy_id)
      redirect_to sessions_two_factor_path
      # session[:user_id] = @user.id
      # redirect_to root_path
    else
      flash.now[:login_error] = "Incorrect password. Try Again."
      @user ||= User.new(email: params[:email])
      render :new
    end
  end

  def two_factor
    return redirect_to new_session_path unless session[:pre_2fa_auth_user_id]
  end

  def verify
    @user = User.find(session[:pre_2fa_auth_user_id])
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])
    if token.ok?
      session[:user_id] = @user.id
      session[:pre_2fa_auth_user_id] = nil
      redirect_to account_path
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :two_factor
    end
  end

  def resend
    @user = User.find(session[:pre_2fa_auth_user_id])
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = "Verification code re-sent"
    redirect_to sessions_two_factor_path
  end

  # def facebook_create
  #   auth = request.env["omniauth.auth"]
  #   user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
  #   session[:user_id] = user.id
  #   redirect_to root_path
  # end

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
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end
end
