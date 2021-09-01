def new_session(email: 'test@test.com', password: 'password')
  user = FactoryBot.create(:user, email: email, password: password)
  visit '/users/sign_in'
  fill_in 'user_email',	with: email
  fill_in 'user_password',	with: password
  click_on 'user_signin_submit'
  user
end

def logout
  visit '/articles'
  click_on 'logout'
end

def new_session_of_user(email, password)
  visit '/users/sign_in'
  fill_in 'user_email',	with: email
  fill_in 'user_password',	with: password
  click_on 'user_signin_submit'
end

def create_article
  visit '/articles'
  page.find('#article-form-field').click
  fill_in 'article-form-body-field',	with: 'test body for new article'
  click_on 'article-form-submit'
end
