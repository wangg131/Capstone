require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @user = create(:user)
    session[:user_id] = @user.id
  end

  describe "POST #create" do
    context "logging in via RoomService" do
      let (:session_params) do
              {
                username: "myspacerox",
                password: "2002"}
      end

      it "creates an authenticated session" do
        post :create, :session => session_params
        expect(session[:user_id]).to eq(@user.id)
      end
    end

    context "logging in via facebook - valid params" do
      before :each do
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
      end

      it "redirects to dashboard page" do
        get :facebook_create, provider: :facebook

        expect(response).to redirect_to root_path
      end

      it "creates a user" do
        expect {
          get :facebook_create, provider: :facebook
          }.to change(User, :count).by(1)
      end

      it "sets user_id and access token" do
        get :facebook_create, provider: :facebook
        expect(session[:user_id]).to eq(User.last.id)
      end
    end
  end

  describe "DELETE #destroy" do
    it "allows user to log out" do
      delete :destroy
      expect(session[:user_id]).to eq(nil)
    end
  end
end
