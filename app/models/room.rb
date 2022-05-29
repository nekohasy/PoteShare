class Room < ApplicationRecord
  has_many :reservations

  mount_uploader :image, ImageUploader
end
