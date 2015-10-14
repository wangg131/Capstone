class UsersController < ApplicationController
  before_filter :authenticate!, only: [:show]
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.create(create_params)

    if @user.save
      # Save the user_id to the session object
      session[:user_id] = @user.id
      # session[:pre_2fa_auth_user_id] = @user.id

      # Create user on Authy, will return an id on the object
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)

      # Send an SMS to your user
      Authy::API.request_sms(id: @user.authy_id)
      redirect_to verify_path

    else
      flash.now[:error] = "Try again, account was not created."
      render :new
    end
  end

  def show_verify
    return redirect_to signup_path unless session[:user_id]
  end

  def verify
    @user = current_user
    # @user = User.find(session[:pre_2fa_auth_user_id])

    # Use Authy to send the verification token
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

    if token.ok?
     # Mark the user as verified for get /user/:id
     @user.update(verified: true)
      # session[:user_id] = @user.id
      # session[:pre_2fa_auth_user_id] = nil
      # Send an SMS to the user 'success'
      send_message("You did it! Signup complete :)")

      redirect_to account_path(@user.id)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    @user = current_user
    # @user = User.find(session[:pre_2fa_auth_user_id])
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = "Verification code re-sent"
    redirect_to verify
  end

  private

  def send_message(message)
    @user = current_user
    twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = @client.account.messages.create(
      :from => twilio_number,
      :to => @user.country_code+@user.phone_number,
      :body => message
    )
    puts message.to
  end

  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :street, :city, :state, :zip, :usertype, :country_code, :authy_id)
  end

end
