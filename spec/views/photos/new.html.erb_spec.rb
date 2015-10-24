require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      :post_id => 1,
      :images => "MyText"
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_post_id[name=?]", "photo[post_id]"

      assert_select "textarea#photo_images[name=?]", "photo[images]"
    end
  end
end
