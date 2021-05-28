def new_session
  FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  visit '/users/sign_in'
  fill_in 'user_email',	with: 'test@test.com'
  fill_in 'user_password',	with: 'password'
  click_on 'user_signin_submit'
end

def create_article
  visit '/articles'
  page.find('#article-form-field').click
  fill_in 'article-form-body-field',	with: 'test body for new article'
  click_on 'article-form-submit'
end
