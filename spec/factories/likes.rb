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
FactoryBot.define do
  factory :like do
    association :user
    association :likeable, factory: :article
  end
end