Given('I logged in a see a article') do
  user = FactoryBot.create(:user)
  @article = FactoryBot.create(:article, author: user)
  new_session
end

When('I write a new comment field and submit') do
  fill_in "comment-form-#{@article.class}-#{@article.id}-body",	with: 'comment text'
  page.find("#comment-form-#{@article.class}-#{@article.id}-body").native.send_key(:return)
end

Then('I should see the comment') do
  expect(page).to have_content 'comment text'
end
