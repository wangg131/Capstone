require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :post_id => 1,
        :images => "MyText"
      ),
      Photo.create!(
        :post_id => 1,
        :images => "MyText"
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
