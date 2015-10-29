require 'securerandom'
class User < ActiveRecord::Base
  has_one :post
  has_one  :profile
  has_many :conversations, :foreign_key => :sender_id
  has_secure_password
  # geocoded_by :address

  # # Validations for users registering and loggin in without facebook
  # validates               :email, presence: true, uniqueness: true, format: {with: /@/},
  #                         :if => lambda { |user| user.try(:provider) == nil }
  #
  # validates_presence_of   :name,
  #                         :password,
  #                         :password_confirmation,
  #                         :phone_number,
  #                         :user_type,
  #                         :if => lambda { |user| user.try(:provider) == nil }

  def self.find_or_create_from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.uid = auth_hash['uid']
    user.oauth_token = auth_hash['credentials']['token']
    user.name = auth_hash['info']['name']
    # Used the SecureRandom library to set the password as a random string for Facebook OAuth.
    # Even though it isn't relevant for Facebook authentication, password validations for email login/signup were making it fail.
    user.password = SecureRandom.uuid
    user.save!
    return user
  end

  def self.address(street, city, state, country)
    address_array = []
    address_array.push(street, city , state, country)
  end
end
