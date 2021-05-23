Given('I am on the homepage') do
  visit '/'
end

Then('I see a welcome message') do
  expect(page).to have_content('Добро пожаловать')
end
