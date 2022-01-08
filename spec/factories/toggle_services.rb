# == Schema Information
#
# Table name: toggle_services
#
#  id         :bigint           not null, primary key
#  env        :string           not null
#  name       :string           not null
#  work       :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :toggle_service do
    name { 'MyString' }
    env { 'MyString' }
    work { false }
  end
end
