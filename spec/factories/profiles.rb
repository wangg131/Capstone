FactoryGirl.define do
  factory :profile do
    id                2
    title             "Partier lookin for Party House YEEAH BRAH"
    house_type        "House"
    description       "Read mah title"
    neighborhoods     ["Phinney Ridge", "Ballard/Fremont"]
    rooms_needed      1
    bathroom_type     ["Shared", "Private"]
    min_price         0
    max_price         900
    cats              false
    dogs              false
    parking           ["Garage", "Street"]
    laundry           "In-unit"
    max_roommates     10
    smoking           true
    user_id           1
  end

end
