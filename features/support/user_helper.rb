def new_session
  FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  visit '/users/sign_in'
  fill_in 'user_email',	with: 'test@test.com'
  fill_in 'user_password',	with: 'password'
  click_on 'user_signin_submit'
end
