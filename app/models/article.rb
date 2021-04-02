# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  body           :text             default(""), not null
#  comments_count :integer          default(0), not null
#  likes_count    :integer          default(0), not null
#  lock           :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :integer          not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => users.id)
#
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
