class Comment < ApplicationRecord
  include Likeable
  belongs_to :user, counter_cache: true
  belongs_to :commentable, counter_cache: true, polymorphic: true
  has_many :likes, as: :likeable

  validates :body, presence: true, length: { maximum: 1000 }
end
