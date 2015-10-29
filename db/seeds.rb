# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)


users =
  # [{ name: 'Sunflower Smith', email: 'sunshine@sun.com', password_digest: 'sdkfjlksdjf',
  #   phone_number: 206-123-456, street: '123 Main Road', city: 'Seattle', state:  'WA',
  #   zip: 98109, provider: nil, user_type: 'host', uid: "68976560124492084", oauth_token: 'ksdjfkldsjokljsdf',
  #   country_code: 1, authy_id: 2345678, verified: true}],

  [{ name: 'Rayman Torkle', email: 'ghjk@gmail.com', password_digest: 'sdkfjlksdjf',
    phone_number: 206-123-433, street: '123 Main Road', city: 'Seattle', state:  'WA',
    zip: 98109, provider: nil, uid: "689765624492084", oauth_token: 'ksdjfkldsjkljsdf',
    user_type: 'seeker', country_code: 1, authy_id: 1232345, verified: true}],

  [{ name: 'Bey Hive', email: 'bey@yawoo.com', password_digest: 'sdkfjlksdjf',
    phone_number: 206-123-476, street: '123 Main Road', city: 'Seattle', state:  'WA',
    zip: 98109, provider: nil, user_type: 'seeker', uid: "6895765624492084", oauth_token: 'ksdojfkldsjkljsdf',
    country_code: 1, authy_id: 1242345, verified: true}],

  [{ name: 'Tom Thomas', email: 'tom@sdf.com', password_digest: 'sdkfjlksdjf',
    phone_number: 206-123-416, street: '123 Main Road', city: 'Seattle', state:  'WA',
    zip: 98109, provider: nil, user_type: 'host', uid: "68977865624492084", oauth_token: 'ksdjfkldsjkljsdof',
    country_code: 1, authy_id: 456789, verified: true}],

  [{ name: 'Jonny Shen', email: 'alexp@yawoo.com', password_digest: 'sdkfjlksdjf',
    phone_number: 206-153-456, street: '123 Main Road', city: 'Seattle', state:  'WA',
    zip: 98109, provider: nil, user_type: 'seeker', uid: "6897656424492084", oauth_token: 'kqsdjfkldsjkljsdf',
    country_code: 1, authy_id: 1232444, verified: true}]

users.each do |user|
  User.create user
end

posts =

  [{ title: 'PARTY HOUSE!!! Cap HIll, you already know.', house_type: 'House', description:
    'Our huge Cap Hill house needs another bro to fill our room. We have a huge garage for your car, backdoor patio to grill some MEAT. If you cant handle meat,
    then youre gonna have a bad time. Your room is on the second floor and is a pretty good size as well. Check out the photos for your reference.
    There are three other guys living here besides you around the ages of 23-26, so expect that we will be having people over quite often..
    Especially on Friday and Saturday nights before we hit the bars which are only a couple blocks away.',
    price: 1000, neighborhood: 'Capitol Hill', rooms_available: 1, total_roommates:  4,
    bathroom_type: "Shared", gender_preference: nil, laundry: "In-unit", parking: "Garage", cats: false, dogs: true, smoking: true, user_id: 4}] # Tom Thomas

posts.each do |post|
  Post.create post
end

profiles =
  [{ title: 'Hippy Free Lovin Dude lookin for chill housemates', house_type: "[\"House\"]", description:
    "I am a free-spirit, peace-loving individual. So chill, you it's like there isn't even another roommate since I just go with the flow, mann. For the common areas, I'll keep it clean to the capacity that you want it to be clean. I stay up late, sleep in, but I don't care if you guys are loud. Heavy sleeper, so go ahead and make a ton of noise. As much as I love the ganja, I can't be around it due to smoke sensitivities. Much love and looking forward to meeting with you.",
    min_price: 500, max_price: 700, neighborhoods: "[\"Private\", \"Shared\"]", rooms_needed: 1, max_roommates: 10, bathroom_type: "[\"Private\", \"Shared\"]", gender_preference: nil, laundry: "[\"In-unit\", \"On-site\", \"In-building\"]",
    parking: "[\"Street\", \"Garage\"]", cats: true, dogs: true, smoking: false, user_id: 3}], # Bey Hive

  [{ title: '23 yo professional looking for awesome flatmates', house_type: "[\"Duplex\", \"Condo\", \"Apartment\"]", description:
    "I am a tech worker in Seattle working at @mazon. I have a dope car that I would like to keep in the garage. I won't be home often because I'll be working at the office pretty late most nights because I'm chasing that promotion. That's good for you, but I'll do my share of chores around the house. I play the guitar, so hopefully it won't be a problem. I can keep it to the garage though if needed.",
    min_price: 400, max_price: 1200, neighborhoods: "[\"Ballard/Fremont\"]", gender_preference: nil,
    rooms_needed: 1, max_roommates: 5, bathroom_type: "[\"Private\", \"Shared\"]", laundry: "[\"In-unit\", \"On-site\", \"In-building\"]",
    parking: "[\"Street\", \"Garage\"]", cats: true, dogs: true, smoking: false, user_id: 2}], # Raymond Torkle

  [{ title: 'Party Boi Lookin For Frat/Flat Mates to Vibe with', house_type: "[\"House\", \"Apartment\", \"Duplex\", \"Condo\"]", description:
    "I am the shiz. I get shit done. I am so cool. You know you want to rent to me. I'm a guy and want to live with all dudes, so you know that we wont give a shat about the house. Messy living = carefree! WOOOO",
    min_price: 500, max_price: 1200, neighborhoods: "[\"Ballard/Fremont\", \"Greenlake\", \"Wallingford\", \"Northgate/Maple Leaf\", \"Lake City\", \"Queen Anne\", \"South Lake Union\", \"Montlake/Eastlake\", \"Madrona/Leschi\", \"Capitol Hill\", \"Central District\", \"Belltown/Denny Triangle/Downtown\", \"Mount Baker\", \"Beacon Hill\", \"Alki\"]",
    rooms_needed: 1, max_roommates: 10, bathroom_type: "[\"Shared\"]", gender_preference: nil, laundry: "[\"In-unit\", \"On-site\", \"In-building\"]",
    parking: "[\"Street\", \"Garage\"]", cats: true, dogs: true, smoking: false, user_id: 5}]

profiles.each do |profile|
  Profile.create profile
end

photos =

  [{ post_id: 1, images: "IMG_2576.JPG"}], # Post 1, Sunflower Smith
  [{ post_id: 1, images: "IMG_2577.JPG"}],
  [{ post_id: 2, images: "caphill.jpg"}] # Pos 2, Tom Thomas

  photos.each do |photo|
    Photo.create photo
  end

# conversations =
#   [{ id: 1, sender_id: 2, recipient_id: 1 }]
#
# conversations.each do |conversation|
#   Conversation.create conversation
# end

# messages =
#   [{ body: "Hi! Your place looks beautiful. How close to the bus lines are you?",
#   conversation_id: 2, user_id: 2, read: false }], # Raymond Torkle
#
#   [{ body: "It's a block away.. Super convenient to get to downtown!",
#   conversation_id: 2, user_id: 1, read: false }], # Sunflower Smith
#
#   [{ body: "Awesome! That's the only other thing that I needed to know. When are you free for me to see the room?",
#   conversation_id: 2, user_id: 2, read: false }],
#
#   [{ body: "I'll be free after the moon eclipse. I'm very busy right now setting up the house for the annual moon worship ceremony. Can you meet in 2 weeks?\r\n",
#   conversation_id: 2, user_id: 1, read: false }],
#
#   [{ body: "Rad! I have a lot of cool constellation stuff that would go well with those decorations. Yeah, I'll message you in a bit to schedule something. Thanks!",
#   conversation_id: 2, user_id: 2, read: false }]
#
# messages.each do |message|
#   Message.create message
# end
