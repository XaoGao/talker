# Scenario: I can remove my like to a article
Given('I logged in and exist a article with my like') do
  user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  @article = FactoryBot.create(:article, author: user)
  @like = FactoryBot.create(:like, likeable: @article, user: user)
  new_session_of_user(user.email, 'password')
end

When('I push a red heart icon') do
  page.find("##{@article.class}-#{@article.id}-likes").click
end

Then('I shoud see total count like minus one') do
  like_count = page.find("##{@article.class}-#{@article.id}-likes-count").text
  expect(like_count).to eq('0')
end

# Scenario: I can remove my like to a comment
Given('I logged in and exist a article and a comment with a like for article') do
  user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  @article = FactoryBot.create(:article, author: user)
  @comment = FactoryBot.create(:comment, user: user, commentable: @article)
  @like = FactoryBot.create(:like, likeable: @comment, user: user)
  new_session_of_user(user.email, 'password')
end

When('I push a red heart icon in a comment area') do
  page.find("##{@article.class}-#{@article.id}-comments").click
  page.find("##{@comment.class}-#{@comment.id}-likes").click
end

Then('I shoud see total count like in comment minus one') do
  like_count = page.find("##{@comment.class}-#{@comment.id}-likes-count").text
  expect(like_count).to eq('0')
end
