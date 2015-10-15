class User < ActiveRecord::Base
  has_many :housing_posts
  has_one  :seeker_bio
  has_secure_password

  # validations for when a user signs up with RoomService and not when a user is logging in with facebook
  validates               :email, presence: true, uniqueness: true, format: {with: /@/},
                          :on => :create

  validates_presence_of   :name,
                          :password,
                          :password_confirmation,
                          :phone_number,
                          :user_type,
                          :on => :create

  def self.find_or_create_from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.uid = auth_hash['uid']
    user.oauth_token = auth_hash['credentials']['token']
    user.name = auth_hash['info']['name']
    user.save!
    return user
  end
end
