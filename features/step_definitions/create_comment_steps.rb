Given('I logged in a see a article') do
  new_session
  create_article
end

When('I write a new comment field and submit') do
  fill_in 'comment-form-Article-1-body',	with: 'comment text'
  page.find('#comment-form-Article-1-body').native.send_key(:return)
end

Then('I should see the comment') do
  expect(page).to have_content 'comment text'
end
