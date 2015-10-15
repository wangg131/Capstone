# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users =
[{ name: 'Cho Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, user_type: 'seeker'}],
[{ name: 'Blue Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, user_type: 'seeker'}],
[{ name: 'Bep Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, user_type: 'host'}],
[{ name: 'Ba Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, user_type: 'seeker'}],
[{ name: 'Bo Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, user_type: 'seeker'}]

users.each do |user|
  User.create user
end
