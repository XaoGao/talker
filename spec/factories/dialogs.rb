# == Schema Information
#
# Table name: dialogs
#
#  id         :bigint           not null, primary key
#  lock       :boolean          default(FALSE), not null
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_dialogs_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
FactoryBot.define do
  factory :dialog do
    name { Faker::Books::Dune.quote }
    association :owner, factory: :user
    lock { false }
    created_at { DateTime.now }
  end
end
