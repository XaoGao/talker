class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :subscriber, class_name: 'User', foreign_key: 'subscriber_id'

  def self.subscriptions(user)
    subscriptions = Friendship.where(subscriber: user).map(&:user_id)
    User.where(id: subscriptions)
  end
end
