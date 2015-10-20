FactoryGirl.define do
  factory :post do
    id                1
    title             "30 year old scientist looking for gurls to move in <3"
    house_type        "House"
    description       "I'm a Barbie Girl Lookin for My Skipper To Move In With Me"
    neighborhood      "Ballard/Fremont"
    rooms_available   2
    bathroom_type     "Shared"
    price             1000
    cats              false
    dogs              false
    parking           "Street"
    laundry           "In-unit"
    total_roommates   3
    smoking           false
    user_id           5
    images            ["GTBWiMK.jpg", "rbFzenY.jpg"]
  end

end
