require 'rails_helper'

RSpec.describe Post, type: :model do

  describe Post do
    let(:post) { create(:post) }

    it { expect(post).to belong_to(:user) }
    it { expect(post).to be_valid }

    context "numericality validations" do
      it "fails with non-integer values" do
        post.rooms_available = "One"
        post.price = "1K"
        post.total_roommates = "A lot"
        expect(post).to_not be_valid
      end
    end
  end

end
