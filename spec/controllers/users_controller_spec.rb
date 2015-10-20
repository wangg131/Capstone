require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do
    before(:each) do
      @user1 = create :user
    end

    describe "GET #new" do
      it "renders the new template" do
        session[:user_id] = @user1.id
        get :new
        expect(assigns(:user)).to be_a_new(User)
        expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      context "with valid user params" do

        let (:user_params) do
          {
            name: "Stimpy",
            email: "whamo@whamo.com",
            password: "log",
            password_confirmation: "log"}
        end

        it "creates a new user" do
          post :create, {user: user_params}
          expect(User.count).to eq(1)
        end
      end

      context "with invalid user params" do
        let (:yuck_user) do
          {
            name: nil,
            email: "whamo.com",
            password: "log",
            password_confirmation: "song"}
        end

        it "doesn't create a new user" do
          post :create, {user: yuck_user}
          expect(response).to render_template(:new)
        end
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, {id: @user1.id}, {user_id: @user1.id}
        expect(response).to render_template(:show)
        expect(response.status).to eq(200)
      end
    end

    describe "before action filters" do
      context "require_login" do
        it "prevents unauthenticated users from accessing the site" do

        get :show, id: @user1.id
        expect(flash[:error]).to eq("You are not currently logged in!")
        expect(response).to redirect_to(login_path)
        end
      end
    end

    # describe "dashboard access" do
    #   context "when a user is signed in" do
    #     it "redirects to the dashboard" do
    #       session[:user_id] = @user1.id
    #
    #       get :dashboard, :id => @user1.id
    #
    #       expect(response).to be_success
    #       expect(response.status).to eq(200)
    #     end
    #   end
    #
    #   context "when no one is signed in" do
    #     it "prevents dashboard from loading" do
    #
    #       get :dashboard, :id => @user1.id
    #       expect(flash[:error]).to eq("You are not currently logged in!")
    #       expect(response).to redirect_to("/login")
    #     end
    #   end
    # end

  describe "Authy::API" do
    describe "Registering users" do

      it "should find or create a user" do
        user = Authy::API.register_user(
          :email => generate_email,
          :cellphone => generate_cellphone,
          :country_code => 1
        )
        user.should be_kind_of(Authy::Response)

        user.should be_kind_of(Authy::User)
        user.should_not be_nil
        user.id.should_not be_nil
        user.id.should be_kind_of(Integer)
      end
    end
  end

end
