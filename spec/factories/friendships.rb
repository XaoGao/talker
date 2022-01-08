# == Schema Information
#
# Table name: friendships
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  subscriber_id :bigint           not null
#  user_id       :bigint
#
# Indexes
#
#  index_friendships_on_subscriber_id  (subscriber_id)
#  index_friendships_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (subscriber_id => users.id)
#
FactoryBot.define do
  factory :friendship do
    association :user, factory: :user
    association :subscriber, factory: :user
  end
end
