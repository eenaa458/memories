class Memory < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :date, presence: true
  validates :images, presence: true
  
  attr_accessor :images_cache
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  
end
