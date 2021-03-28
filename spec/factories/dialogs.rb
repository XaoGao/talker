FactoryBot.define do
  factory :dialog do
    name { Faker::Books::Dune.quote }
    association :owner, factory: :user
    lock { false }
    created_at { DateTime.now}
  end
end
