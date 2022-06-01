class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :content
    validates :price
    validates :address
    validates :image
  end

  mount_uploader :image, ImageUploader
end
