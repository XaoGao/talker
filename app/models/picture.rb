class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_one_attached :image

  validates :title, presence: true
end
