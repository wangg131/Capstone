class UsersController < ApplicationController
  before_filter :require_login, only: [:show]
  before_filter :current_user, only: [:verify, :resend, :show]

  def new
    @user = User.new
  end

  def show
    @user = current_user
    @profile = @user.profile
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
    @user = current_user
    # Use Authy to send the verification token
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

    if token.ok?

      # Mark the user as verified for get /user/:id
      @user.update_columns(verified: true)

      # Conditional to prevent this from affecting unverified users
      if @user.verified == true && @user.user_type == 'host'
        redirect_to new_user_post_path(@user.id)
      elsif @user.verified == true && @user.user_type == 'seeker'
       redirect_to new_user_profile_path(@user.id)
      end
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    @user = current_user
    Authy::API.request_sms(id: @user.authy_id, force: true)
    flash[:notice] = "Verification code re-sent"
    redirect_to verify_path
  end

  private

  # def send_message(message)
  #   @user = current_user
  #   twilio_number = ENV['TWILIO_NUMBER']
  #   @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  #   message = @client.account.messages.create(
  #     :from => twilio_number,
  #     :to => @user.country_code+@user.phone_number,
  #     :body => message
  #   )
  #   puts message.to
  # end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
    :phone_number, :street, :city, :state, :zip, :user_type, :country_code, :authy_id)
  end

end
