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
