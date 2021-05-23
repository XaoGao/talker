FactoryBot.define do
  factory :article do
    body { Faker::Name.first_name }
    comments_count { 0 }
    likes_count { 0 }
    lock { false }
    association :author, factory: :user
  end
end
