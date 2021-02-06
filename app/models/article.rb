class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_one :picture, as: :imageable
  has_many :likes, as: :likeable

  def image?
    picture.present? && picture.is_main
  end

  def image
    picture.image
  end

  def image_title
    picture.title
  end

  def user_liked?(user)
    likes.where(user: user).any?
  end
end
