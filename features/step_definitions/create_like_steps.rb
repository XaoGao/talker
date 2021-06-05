# Scenario: I can create a like to a article
Given('I logged in and exist a article') do
  user = FactoryBot.create(:user)
  @article = FactoryBot.create(:article, author: user)
  new_session
end

When('I push heart icon') do
  page.find("##{@article.class}-#{@article.id}-likes").click
end

Then('I shoud see total count like plus one') do
  like_count = page.find("##{@article.class}-#{@article.id}-likes-count").text
  expect(like_count).to eq('1')
end

# Scenario: I can create a like to a comment
Given('I logged in and exist a article and a comment for article') do
  user = FactoryBot.create(:user)
  @article = FactoryBot.create(:article, author: user)
  @comment = FactoryBot.create(:comment, user: user, commentable: @article)
  new_session
end

When('I push heart icon in a comment area') do
  page.find("##{@article.class}-#{@article.id}-comments").click
  page.find("##{@comment.class}-#{@comment.id}-likes").click
end

Then('I shoud see total count like in comment plus one') do
  like_count = page.find("##{@comment.class}-#{@comment.id}-likes-count").text
  expect(like_count).to eq('1')
end
