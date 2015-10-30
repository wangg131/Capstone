require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_login_name

  SEATTLE_SELECT =
    [
      ['North Seattle',
       [["Phinney Ridge"], ["Greenwood/Crown Hill"],
       ["Haller Lake/Bitter Lake/Broadview"], ["Ballard/Fremont"],
       ["Greenlake"], ["Wallingford"], ["Northgate/Maple Leaf"],
       ["Lake City"], ["University District"], ["Roosevelt/Ravenna"],
       ["Windermere/Laurelhurst"], ["Wedgwood/Sandpoint"]]
      ],
     ['Central Seattle',
       [["Magnolia/Interbay"],["Queen Anne"],
       ["South Lake Union"], ["Montlake/Eastlake"],
       ["Madison Park/Madison Valley"], ["Madrona/Leschi"],
       ["First Hill"], ["Capitol Hill"], ["Central District"],
       ["International District"], ["Belltown/Denny Triangle/Downtown"],
       ["Pioneer Square"]]
       ],
    ['South Seattle',
      [["Mount Baker"], ["Beacon Hill"], ["Georgetown"],
      ["SODO/Industrial District"], ["Columbia City/Seward Park"],
      ["Rainier Valley"], ["Rainier Beach"], ["South Park"],
      ["Alki"], ["West Seattle"]]
      ]
    ]

  HOUSING_TYPES =
    {"House"=> "House", "Apartment" => "Apartment", "Duplex" => "Duplex",
      "Condo" => "Condo", "In-Law" => "In-Law"}


  MESSAGES = {not_logged_in: "You are not currently logged in!",
              already_logged_in: "Can't access login page because you're already logged in!",
              already_signed_up: "You're already a member!",
              access_denied: "You can't access that page."
  }

  def neighborhoods_housetypes
    @neighborhoods = SEATTLE_SELECT.each {|neighborhood| neighborhood}
    @housing_types = HOUSING_TYPES
  end

  def set_login_name
   @user = User.find_by(id: session[:user_id])

   @user_name = @user ? @user.name : "Guest"
  end

  def require_login
    redirect_to login_path, flash: {error: MESSAGES[:not_logged_in]} unless session[:user_id]
  end

  before_filter -> { flash.now[:notice] = flash[:notice].html_safe if flash[:html_safe] && flash[:notice] }

  # def logged_in_user
  #   redirect_to dashboard_path(session[:user_id]), flash: {error: MESSAGES[:already_logged_in]} if session[:user_id]
  # end
  #
  # def registered_user
  #   redirect_to dashboard_path(session[:user_id]), flash: {error: MESSAGES[:already_signed_up]} if session[:user_id]
  # end
  #
  # def access_denied
  #   redirect_to dashboard_path(session[:user_id]), flash: {error: MESSAGES[:access_denied]} if session[:user_id] != @user.id
  # end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in?
    current_user.present?
  end
  helper_method :signed_in?

  def disable_nav
    @disable_nav = true
  end

  protected

  def authenticate!
    redirect_to login_path and return unless signed_in?
  end
end
