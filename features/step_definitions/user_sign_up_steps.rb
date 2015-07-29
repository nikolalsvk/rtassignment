Given(/^user is on sign up form$/) do
  visit new_user_registration_path
end

When(/^user fills out sign up form$/) do
  fill_in "Email", :with => "minikermit@hotmail.com"
  fill_in "Password", :with => "12345678"
  fill_in "Password confirmation", :with => "12345678"

  click_button "Sign up"
end

Then(/^user should be registered$/) do
  page.should have_content("Logged in as minikermit@hotmail.com")
end
