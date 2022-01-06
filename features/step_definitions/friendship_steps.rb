# I can add user to subscriptions
Given('I logged in and exist another user') do
  @user = FactoryBot.create(:user)
  @new_user = new_session
end

When('I push button add friend') do
  visit '/users'
  page.find("#add-user-#{@user.id}").click
end

Then('I shoud see the user in subscription') do
  visit "users/#{@new_user.slug}/subscriptions"
  expect(page).to have_content(@user.username)
end

# I can remove a user form my subscriptions
Given('I logged in and i have a subscription') do
  @user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  @another = FactoryBot.create(:user)
  @sub = FactoryBot.create(:friendship, user: @another, subscriber: @user)
  new_session_of_user(@user.email, 'password')
end

When('I push button remove a friend') do
  visit '/users'
  page.find("#remove-user-#{@another.id}").click
end

Then('I shoud see the user do not a subscription') do
  visit "users/#{@user.slug}/subscriptions"
  expect(page).to_not have_content(@another.username)
end
# I in subscribers another user
Given('I logged in and exist another user and i subscribers') do
  @user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  @another = FactoryBot.create(:user)
  @sub = FactoryBot.create(:friendship, user: @user, subscriber: @another)
  new_session_of_user(@user.email, 'password')
end

When('I visit subscribers 1') do
  visit "users/#{@user.slug}/subscribers"
end

Then('I shoud see username another user') do
  expect(page).to have_content(@another.username)
end
# I do not in subscribers another user
Given('I logged') do
  @user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  @another = FactoryBot.create(:user)
  new_session_of_user(@user.email, 'password')
end

When('I visit subscribers 2') do
  visit "users/#{@user.slug}/subscribers"
end

Then('I shoud not see any username') do
  expect(page).to_not have_content(@another.username)
end
