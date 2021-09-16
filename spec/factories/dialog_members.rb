FactoryBot.define do
  factory :dialog_member do
    association :member, factory: :user
    association :dialog, factory: :dialog
    created_at { DateTime.now }
  end
end
