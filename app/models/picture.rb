class Picture < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { in: 1..140 }
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
