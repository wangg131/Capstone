require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    let(:user) { create(:user) }

    it { expect(user).to respond_to(:name) }
    it { expect(user).to have_one(:post) }
    it { expect(user).to be_valid }

    context "presence validations" do
      it "fails with nil value" do
        user.name = nil
        user.password = nil
        user.password_confirmation = nil
        user.phone_number = nil
        user.user_type = nil
        expect(user).to_not be_valid
      end
    end
  end
end
