Given('I logged in and exit another user') do
  @user = FactoryBot.create(:user)
  @new_user = new_session
end

When('I push button add fiiend') do
  visit '/users'
  page.find("#add-user-#{@user.id}").click
end

Then('I shou see the user in subscription') do
  visit "/subscriptions?user_id=#{@new_user.id}"
  expect(page).to have_content(@user.username)
end
