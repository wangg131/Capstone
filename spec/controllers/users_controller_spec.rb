require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before(:each) do
      @user1 = create :user
    end

    describe "GET #new" do
      it "renders the new template" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
        expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      context "with valid user params" do

        let (:user_params) do
          {
            username: "Stimpy",
            email: "whamo@whamo.com",
            password: "log",
            password_confirmation: "log"}
        end

        it "creates a new user" do
          post :create, :user => user_params
          expect(User.count).to eq(1)
        end
      end

      context "with invalid user params" do
        let (:yuck_user) do
          {
            username: "Eeeediot",
            email: "whamo.com",
            password: "log",
            password_confirmation: "song"}
        end

        it "doesn't create a new user" do
          post :create, :user => yuck_user
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

end
