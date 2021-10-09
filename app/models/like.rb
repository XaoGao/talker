# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  likeable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :bigint           not null
#  user_id       :integer          not null
#
# Indexes
#
#  index_likes_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :likeable, polymorphic: true, counter_cache: true

  def likeable_type_with_id
    "#{likeable_type}-#{likeable_id}"
  end

  def recipients
    result = []

    case likeable_type
    when 'Article'
      result << likeable.author
    when 'Comment'
      result << likeable.user
    when 'Picture'
      result << likeable.imageable
    end

    result
  end
end
