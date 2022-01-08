# == Schema Information
#
# Table name: exchange_rates
#
#  id         :bigint           not null, primary key
#  EUR        :string           default(""), not null
#  USD        :string           not null
#  current    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :exchange_rate do
    EUR  { Faker::Number.decimal(l_digits: 2).to_s }
    USD  { Faker::Number.decimal(l_digits: 2).to_s }
    current { false }
  end
end
