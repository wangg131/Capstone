class UsersController < ApplicationController
  before_filter :require_login, only: [:show]
  before_filter :current_user, only: [:show, :verify, :resend]
  before_filter :logged_in_user, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id

      # Create user on Authy, will return an id on the object
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: "1"
      )
      @user.update(authy_id: authy.id)
      # Send an SMS to your user
      Authy::API.request_sms(id: @user.authy_id, force: true)
      redirect_to show_verify_path
    else
      flash.now[:error] = "Account was not created. Please try again."
      render :new
    end
  end

  def show_verify
    return redirect_to signup_path unless session[:user_id]
  end

  def verify

    # Use Authy to send the verification token
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

    if token.ok?

      # Mark the user as verified for get /user/:id
      @user.update_columns(verified: true)

      # Conditional to prevent this from affecting unverified users
      if @user.verified == true && @user.user_type == 'host'
        redirect_to new_post_path
      elsif @user.verified == true && @user.user_type == 'seeker'
       redirect_to new_profile_path
      end
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    Authy::API.request_sms(id: @user.authy_id, force: true)
    flash[:notice] = "Verification code re-sent"
    redirect_to verify_path
  end

  def show; end

  def index
    @user1 = User.address(@user.street, @user.city, @user.state, @user.country)
  end

  def determine_type
    @user
  end

  def update_type
    @user.update_columns(user_type: user_params[:user_type])
    if @user.user_type == "host"
      redirect_to new_post_path
    elsif @user.user_type == "seeker"
      redirect_to new_profile_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
    :phone_number, :street, :city, :state, :zip, :country, :user_type, :country_code,
    :authy_id, :post_id, :profile_id)
  end

end
