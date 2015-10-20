require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

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
