class MemoryImage < ApplicationRecord
  belongs_to :memory
  mount_uploader :image, ImageUploader
end
