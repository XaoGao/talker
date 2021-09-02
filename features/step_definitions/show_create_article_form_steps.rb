# I see a form to create a new article
Given('I am logged in') do
  new_session(email: 't1@t.t')
end

When('I click button new article') do
  page.find('#article-form-field').click
end

Then('I should see a form for new article') do
  expect(page).to have_content(I18n.t('articles.form.add_news'))
end
