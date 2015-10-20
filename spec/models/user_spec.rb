require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    let(:user_seeker) { create(:user) }
    let(:user_host) { create(:user, user_type: "host", post_id: 1, profile_id: nil) }
    let(:invalid_email) { build(:user, email: "bad_email") }

    it { expect(user_seeker).to have_one(:profile) }
    it { expect(user_seeker).to be_valid }
    it { expect(user_host).to have_one(:post) }
    it { expect(user_host).to be_valid }
    it { should validate_uniqueness_of(:email) }

    context "validations" do
      it "requires presence of attributes" do
        user_seeker.name = nil
        user_seeker.password = nil
        user_seeker.password_confirmation = nil
        user_seeker.phone_number = nil
        user_seeker.user_type = nil
        expect(user_seeker).to_not be_valid
      end
    end

    context "email validations" do
      it "requires email to have a valid format" do
        expect(invalid_email).to_not be_valid
      end
    end
  end
end
