class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_one_attached :image

  has_many :likes
  has_many :comments

  validates :title, presence: true
end
