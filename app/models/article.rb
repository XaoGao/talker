class Article < ApplicationRecord
  include Likeable
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_one :picture, as: :imageable
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  def image?
    picture.present? && picture.is_main
  end

  def image
    picture.image
  end

  def image_title
    picture.title
  end
end
