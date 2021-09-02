# I can create a new article an see in a wall
Given('I logged in and click input Create article') do
  new_session(email: 't2@t.t')
  visit '/articles'
  page.find('#article-form-field').click
end

When('I write a body input and submit form') do
  fill_in 'article-form-body-field',	with: 'test body for new article'
  click_on 'article-form-submit'
end

Then('I should see a new article in a news wall') do
  expect(page).to have_content('test body for new article')
end
