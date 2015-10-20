require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    let(:user_seeker) { create(:user) }
    let(:user_host) { create(:user, user_type: "host", post_id: 1, profile_id: nil) }

    it { expect(user_seeker).to have_one(:profile) }
    it { expect(user_seeker).to be_valid }
    it { expect(user_host).to have_one(:post) }
    it { expect(user_host).to be_valid }

    context "presence validations" do
      it "fails with nil value" do
        user_seeker.name = nil
        user_seeker.password = nil
        user_seeker.password_confirmation = nil
        user_seeker.phone_number = nil
        user_seeker.user_type = nil
        expect(user_seeker).to_not be_valid
      end
    end
  end
end
