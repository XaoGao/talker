FactoryBot.define do
  factory :friendship do
    association :user, factory: :user
    association :subscriber, factory: :user
  end
end
