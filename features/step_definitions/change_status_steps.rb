Given('I logged in and visit my page') do
  @user = new_session
  visit user_path(@user)
end

When('I click on my status and change text') do
  page.find('.my-status').click
  page.find('.chanched-status').set('This first sleeping bag should be 0 degrees F')
  page.execute_script('$(".chanched-status").trigger("blur")')
end

Then('I see a new status') do
  expect(page).to have_content('This first sleeping bag should be 0 degrees F')
end
