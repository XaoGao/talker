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
FactoryBot.define do
  factory :comment do
    body { Faker::Name.first_name }
    likes_count { 0 }
    lock { false }
    spam { false }
    association :user
    association :imageable, factory: :article
  end
end
