require 'faker'

# 50.times do |i|
#   User.create(
#     email: "test#{i + 10}@test.com",
#     password: 'password',
#     username: Faker::Internet.username,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     status: Faker::Books::Dune.quote,
#     interests: '',
#     date_of_birth: Faker::Date.between(from: '1992-09-23', to: '1998-09-25'),
#     gender: i.odd? ? User.genders[:man] : User.genders[:woman],
#     role: User.roles[:user]
#   )
# end
# 100.times {
#   Article.create(
#     body: Faker::Lorem.paragraph(sentence_count: 3),
#     author: User.all.sample,
#     likes_count: 0,
#     comments_count: 0
#   )
# }

# 20.times {
#   Message.create(
#     sender: user,
#     dialog: dialog,
#     body: Faker::Lorem.paragraph(sentence_count: 5)
#   )
# }


# ToggleService.create(
#   name: 'money',
#   env: 'test',
#   work: false
# )


# u = User.first
# Article.all.each do |article|
#   u.bookmarks.new(bookmarkable_id: article.id, bookmarkable_type: article.class) unless u.bookmarks.include? article
#   u.save
# end
