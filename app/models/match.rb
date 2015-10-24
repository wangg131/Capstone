class Match < ActiveRecord::Base
  belongs_to :profile
  belongs_to :post
end
