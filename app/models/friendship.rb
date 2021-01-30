class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :subscriber, class_name: 'User', foreign_key: 'subscriber_id'

  def self.subscriptions(user)
    subscriptions = Friendship.where(subscriber: user)
    users = []
    subscriptions.each do |subscription|
      users.push(User.find(subscription.user_id))
    end
    users
  end
end
