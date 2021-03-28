FactoryBot.define do
  factory :message do
    body { Faker::Lorem.paragraph(sentence_count: 3) }
    lock { false }
    association :sender, factory: :user
    association :dialog, factory: :dialog
    is_read { false }
    created_at { DateTime.now }
  end
end
