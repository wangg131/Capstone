FactoryGirl.define do
  factory :user do
    name                    "Woo Wang"
    email                   "woo@woo.com"
    password                "woo"
    password_confirmation   "woo"
    password_digest         "rlksdjfs"
    phone_number            3604216650
    country_code            1
    user_type               "seeker"
    authy_id                123445
    post_id                 nil
    profile_id              2
  end
end
