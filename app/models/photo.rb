class Photo < ActiveRecord::Base
  belongs_to :post
  
  # Mounted Objects -----------------------
  mount_uploader :images, ImageUploader
end
