When(/^user tries to access someone elses character type$/) do
  visit char_type_path(:id => 1)
end

Then(/^user should be redirected to his character types$/) do
  page.should have_content("Listing character types")
  page.should have_content("Logged in as minikermit@hotmail.com")
end
