require 'faker'

10.times do |i|
  User.create(
    email: "test#{i}@test.com",
    password: "password",
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    status: Faker::Books::Dune.quote,
    interests: "",
    date_of_birth: Faker::Date.between(from: '1992-09-23', to: '1998-09-25')
  )
end
