class MemoryImage < ApplicationRecord
  belongs_to :memory, inverse_of: :memory_images
  
  mount_uploader :image, ImageUploader
end
