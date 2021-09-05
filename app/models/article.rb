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
  include Orderable
  include Picturable

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :author, class_name: 'User', foreign_key: 'author_id', dependent: :destroy
  has_one :picture, as: :imageable
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  scope :with_author, -> { includes([:author]) }

  def as_indexed_json(_options = {})
    self.as_json
  end

  def image?
    picture.present? && picture.is_main
  end

  def image
    picture.image
  end

  def image_title
    picture.title
  end

  def created_time
    created_at.strftime('%Y %m %H:%M')
  end

  settings index: { number_of_shards: 1 } do
    mapping dynamic: 'false' do
      indexes :id,             type: :keyword
      indexes :body,           type: :keyword
      indexes :comments_count, type: :integer
      indexes :likes_count,    type: :integer
      indexes :lock,           type: :boolean
      indexes :created_at,     type: :date, format: :date_optional_time
      indexes :updated_at,     type: :date, format: :date_optional_time
      indexes :author_id,      type: :integer
    end
  end
end
