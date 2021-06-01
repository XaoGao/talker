# == Schema Information
#
# Table name: exchange_rates
#
#  id         :integer          not null, primary key
#  EUR        :integer          default(0), not null
#  USD        :integer          not null
#  last       :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :exchange_rate do
    
  end
end
