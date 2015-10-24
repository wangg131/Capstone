require 'rails_helper'

RSpec.describe "matches/new", type: :view do
  before(:each) do
    assign(:match, Match.new(
      :post_id => 1,
      :profile_id => 1,
      :approved? => false
    ))
  end

  it "renders new match form" do
    render

    assert_select "form[action=?][method=?]", matches_path, "post" do

      assert_select "input#match_post_id[name=?]", "match[post_id]"

      assert_select "input#match_profile_id[name=?]", "match[profile_id]"

      assert_select "input#match_approved?[name=?]", "match[approved?]"
    end
  end
end
