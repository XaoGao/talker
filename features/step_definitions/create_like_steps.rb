Given('I logged in and exist a article') do
  new_session
  create_article
end

When('I push heart icon') do
  page.find('#Article-1-likes').click
end

Then('I shoud see total count like plus one') do
  like_count = page.find('#Article-1-likes-count').text
  expect(like_count).to eq('1')
end
