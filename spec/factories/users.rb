FactoryBot.define do
  factory :user do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    username      { Faker::Internet.username }
    password      { 'password' }
    status        { Faker::Books::Dune.quote }
    interests     { Faker::Lorem.paragraph(sentence_count: 3) }
    date_of_birth { Faker::Date.between(from: '1992-09-23', to: '1998-09-25') }
    lock          { false }
    email         { Faker::Internet.email }
    gender        { rand(4) }
    country       { Faker::Address.community }
    city          { Faker::Address.city }
    online        { false }
  end
end
