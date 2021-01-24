class Article < ApplicationRecord
  belongs_to :author,  class_name: 'User', foreign_key: 'author_id'
  has_one :picture, as: :imageable

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
