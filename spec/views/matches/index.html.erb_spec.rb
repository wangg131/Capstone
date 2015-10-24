require 'rails_helper'

RSpec.describe "matches/index", type: :view do
  before(:each) do
    assign(:matches, [
      Match.create!(
        :post_id => 1,
        :profile_id => 2,
        :approved? => false
      ),
      Match.create!(
        :post_id => 1,
        :profile_id => 2,
        :approved? => false
      )
    ])
  end

  it "renders a list of matches" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
