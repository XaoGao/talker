Given('I am logged in') do
  new_session
end

When('I click button new article') do
  page.find('#article-form-field').click
end

Then('I should see a form for new article') do
  expect(page).to have_content(I18n.t('articles.form.add_news'))
end
