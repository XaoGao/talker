Given('I am on signup page') do
  visit '/users/sign_up'
end

When('I signup a new account') do
  fill_in 'user_email',	with: 'test@test.com'
  fill_in 'user_first_name',	with: 'jhon'
  fill_in 'user_last_name',	with: 'jhon'
  fill_in 'user_username',	with: 'jhon.jhon'
  fill_in 'user_password',	with: 'password'
  fill_in 'user_password_confirmation',	with: 'password'
  click_on 'user_signup_submit'
end

Then('I see a welcome message for new user') do
  expect(page).to have_content('Welcome! You have signed up successfully.') 
end
