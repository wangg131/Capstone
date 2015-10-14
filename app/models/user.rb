class User < ActiveRecord::Base
  has_secure_password

  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["name"]
  #   end
  # end

  def self.find_or_create_from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.uid = auth_hash['uid']
    user.password = 'placeholder_password'
    user.oauth_token = auth_hash['credentials']['token']
    user.name = auth_hash['info']['name']
    user.oauth_expires_at = auth_hash['credentials']['expires_at']
    user.save!
    return user
  end
end
