# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  body           :text             default(""), not null
#  comments_count :integer          default(0), not null
#  likes_count    :integer          default(0), not null
#  lock           :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :integer          not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => users.id)
#
FactoryBot.define do
  factory :article do
    body { Faker::Name.first_name }
    comments_count { 0 }
    likes_count { 0 }
    lock { false }
    association :author, factory: :user
  end
end
