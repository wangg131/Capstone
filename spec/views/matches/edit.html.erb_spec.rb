require 'rails_helper'

RSpec.describe "matches/edit", type: :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :post_id => 1,
      :profile_id => 1,
      :approved? => false
    ))
  end

  it "renders the edit match form" do
    render

    assert_select "form[action=?][method=?]", match_path(@match), "post" do

      assert_select "input#match_post_id[name=?]", "match[post_id]"

      assert_select "input#match_profile_id[name=?]", "match[profile_id]"

      assert_select "input#match_approved?[name=?]", "match[approved?]"
    end
  end
end
