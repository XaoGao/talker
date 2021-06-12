# == Schema Information
#
# Table name: friendships
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  subscriber_id :integer          not null
#  user_id       :integer
#
# Indexes
#
#  index_friendships_on_subscriber_id  (subscriber_id)
#  index_friendships_on_user_id        (user_id)
#
# Foreign Keys
#
#  subscriber_id  (subscriber_id => users.id)
#
class Friendship < ApplicationRecord
  include Picturable
  belongs_to :user
  belongs_to :subscriber, class_name: 'User', foreign_key: 'subscriber_id'

  def self.subscriptions(user)
    subscriptions = Friendship.where(subscriber: user).map(&:user_id)
    User.includes([pictures: { image_attachment: :blob }]).where(id: subscriptions)
  end
end
