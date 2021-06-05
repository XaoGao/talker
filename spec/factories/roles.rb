# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :role do
    name { "MyString" }
    lock { false }
  end
end
