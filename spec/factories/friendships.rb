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
FactoryBot.define do
  factory :friendship do
    association :user, factory: :user
    association :subscriber, factory: :user
  end
end
