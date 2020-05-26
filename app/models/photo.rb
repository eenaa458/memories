class Photo < ApplicationRecord
  belongs_to :memory
  
  mount_uploader :image, ImageUploader
end
