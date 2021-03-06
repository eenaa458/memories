class Memory < ApplicationRecord
  belongs_to :user
  
  validates :title, presence:true, length: { maximum: 255 }
  validates :content, presence:true, length: { maximum: 255 }
  validates :date, presence: true
  
  has_many :memory_images, dependent: :destroy
  accepts_nested_attributes_for :memory_images, allow_destroy: true
  
  has_many :add_memories, dependent: :destroy
end
