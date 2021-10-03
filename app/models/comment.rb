# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text             default(""), not null
#  commentable_type :string
#  likes_count      :integer          default(0), not null
#  lock             :boolean          default(FALSE), not null
#  spam             :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  user_id          :integer          not null
#
# Indexes
#
#  index_comments_on_commentable_type_and_commentable_id  (commentable_type,commentable_id)
#  index_comments_on_user_id                              (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Comment < ApplicationRecord
  include Likeable
  include Typeable

  belongs_to :user, counter_cache: true, dependent: :destroy
  belongs_to :commentable, counter_cache: true, polymorphic: true, dependent: :destroy
  has_many :likes, as: :likeable

  validates :body, presence: true, length: { maximum: 1000 }

  scope :with_user, -> { includes([:user]) }
end
