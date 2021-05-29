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
