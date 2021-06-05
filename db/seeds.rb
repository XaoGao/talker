require 'faker'

# 50.times do |i|
#   User.create(
#     email: "test#{i+10}@test.com",
#     password: "password",
#     username: Faker::Internet.username,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     status: Faker::Books::Dune.quote,
#     interests: "",
#     date_of_birth: Faker::Date.between(from: '1992-09-23', to: '1998-09-25')
#   )
# end
# user = User.first
# 10.times {
#   Article.create(
#     body: Faker::Lorem.paragraph(sentence_count: 3),
#     author: user
#   )
# }
# user = User.first
# dialog = Dialog.first
# 20.times { 
#   Message.create(
#     sender: user,
#     dialog: dialog,
#     body: Faker::Lorem.paragraph(sentence_count: 5)
#   )
# }
# Article.all.each do |a| 
#   a.likes_count = 0
#   a.save
# end
# Article.all.each do |a| 
#   a.comments_count = 0
#   a.save
# end

# User.all.each do |u|
#   u.gender = 0
# end

# ['default', 'user', 'admin'].each do |role|
#   Role.create(name: role, lock: false)
# end

# User.all.each do |user|
#   user.update(role: Role.first)
# end