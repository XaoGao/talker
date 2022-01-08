# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action          :string
#  notifiable_type :string           not null
#  read_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  actor_id        :bigint           not null
#  notifiable_id   :bigint           not null
#  recipient_id    :bigint           not null
#
# Indexes
#
#  index_notifications_on_actor_id      (actor_id)
#  index_notifications_on_recipient_id  (recipient_id)
#
# Foreign Keys
#
#  fk_rails_...  (actor_id => users.id)
#  fk_rails_...  (recipient_id => users.id)
#
FactoryBot.define do
  factory :notification do
    action       { 'liked' }
    read_at      { nil }
    association :actor, factory: :user
    association :recipient, factory: :user
    association :notifiable, factory: :like
  end
end
