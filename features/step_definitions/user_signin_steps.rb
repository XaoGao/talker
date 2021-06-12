Given('I am on signin page and user exist') do
  FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  visit '/users/sign_in'
end

When('I write email\/password and click submit') do
  fill_in 'user_email',	with: 'test@test.com'
  fill_in 'user_password',	with: 'password'
  click_on 'user_signin_submit'
end

Then('I should see welcome message') do
  expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
end
