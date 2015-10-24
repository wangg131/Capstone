require 'rails_helper'

RSpec.describe "matches/show", type: :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :post_id => 1,
      :profile_id => 2,
      :approved? => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
