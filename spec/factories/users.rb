# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  city                   :string           default(""), not null
#  comments_count         :integer          default(0), not null
#  country                :string           default(""), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  date_of_birth          :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  gender                 :integer          default("unset"), not null
#  interests              :string           default(""), not null
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  likes_count            :integer          default(0), not null
#  locale                 :string           default("en")
#  lock                   :boolean          default(FALSE), not null
#  online                 :boolean          default(FALSE), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default(NULL), not null
#  sign_in_count          :integer          default(0), not null
#  slug                   :string
#  status                 :string           default(""), not null
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
FactoryBot.define do
  factory :user do
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    username        { Faker::Internet.username }
    password        { 'password' }
    status          { Faker::Books::Dune.quote }
    interests       { Faker::Lorem.paragraph(sentence_count: 3) }
    date_of_birth   { Faker::Date.between(from: '1992-09-23', to: '1998-09-25') }
    lock            { false }
    email           { Faker::Internet.email }
    gender          { rand(4) }
    country         { Faker::Address.community }
    city            { Faker::Address.city }
    online          { false }
    role            { User.roles[:user] }
    last_sign_in_at { DateTime.now }
  end
end
