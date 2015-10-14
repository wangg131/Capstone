# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users =
[{ name: 'Cho Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, usertype: 'seeker'}],
[{ name: 'Blue Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, usertype: 'seeker'}],
[{ name: 'Bep Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, usertype: 'host'}],
[{ name: 'Ba Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, usertype: 'seeker'}],
[{ name: 'Bo Knowles', email: 'woo@yawoo.com', password_digest: 'sdkfjlksdjf', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109, provider: nil, usertype: 'seeker'}]

users.each do |user|
  User.create user
end

# hosts =
# [{ name: 'Cho Knowles', email: 'woo@yawoo.com', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109}],
# [{ name: 'Blue Knowles', email: 'woo@yawoo.com', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109}],
# [{ name: 'Bep Knowles', email: 'woo@yawoo.com', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109}],
# [{ name: 'Ba Knowles', email: 'woo@yawoo.com', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109}],
# [{ name: 'Bo Knowles', email: 'woo@yawoo.com', phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA', zip: 98109}]
#
# seekers =
# [{ name: 'Mary Jones', email: 'loo@yawoo.com', phone_number: 360-123-456}],
# [{ name: 'Lorrin White', email: 'chu@yawoo.com', phone_number: 444-123-456,}],
# [{ name: 'Boo Bee', email: 'goo@yawoo.com', phone_number: 888-123-456,}],
# [{ name: 'Hoo Haa', email: 'moo@yawoo.com', phone_number: 999-123-456,}],
# [{ name: 'Ho Lee', email: 'poo@yawoo.com', phone_number: 000-123-456,}]
#
# hosts.each do |host|
#   Host.create host
# end
#
# seekers.each do |seeker|
#   Seeker.create seeker
# end
