class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_login_name

  MESSAGES = {not_logged_in: "You are not currently logged in!",
              already_logged_in: "Can't access login page because you're already logged in!",
              already_signed_up: "You're already a member!"
  }

  def set_login_name
   @user = User.find_by(id: session[:user_id])

   @user_name = @user ? @user.name : "Guest"
  end

  def require_login
    redirect_to login_path, flash: {error: MESSAGES[:not_logged_in]} unless session[:user_id]
  end

  def logged_in_user
    redirect_to dashboard_path(session[:user_id]), flash: {error: MESSAGES[:already_logged_in]} if session[:user_id]
  end

  def registered_user
    redirect_to dashboard_path(session[:user_id]), flash: {error: MESSAGES[:already_signed_up]} if session[:user_id]
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in?
    current_user.present?
  end
  helper_method :signed_in?

  protected

  def authenticate!
    redirect_to new_session_path and return unless signed_in?
  end
end
