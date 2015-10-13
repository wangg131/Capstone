class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  MESSAGES = {not_logged_in: "You are not currently logged in!",
              already_logged_in: "Can't access login page because you're already logged in!",
              already_signed_up: "You're already a member!"
  }

  def require_login
    redirect_to login_path, flash: {error: MESSAGES[:not_logged_in]} unless session[:user_id]
  end
  
  def logged_in_user
    redirect_to dashboard_path(session[:user_id]), flash: {error: MESSAGES[:already_logged_in]} if session[:user_id]
  end

  def registered_user
    redirect_to dashboard_path(session[:user_id]), flash: {error: MESSAGES[:already_signed_up]} if session[:user_id]
  end

end
