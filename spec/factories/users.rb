FactoryGirl.define do
  factory :user do
    id                      5
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

  # factory :user_host do
  #   id                      6
  #   name                    "Tianna"
  #   email                   "shoo@shoo.com"
  #   password                "shoo"
  #   password_confirmation   "shoooo"
  #   password_digest         "rlksdjfs"
  #   phone_number            3604216650
  #   country_code            1
  #   user_type               "host"
  #   authy_id                567887
  #   post_id                 1
  #   profile_id              nil
  # end
end
