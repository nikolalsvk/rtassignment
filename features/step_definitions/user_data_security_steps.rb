When(/^user tries to access someone elses character type$/) do
  visit char_type_path(:id => 1)
end

Then(/^user should be redirected to his character types$/) do
  page.should have_content("The page you were looking for doesn't exist")
end

When(/^user tries to access someone elses character attributes$/) do
  visit char_type_char_attribute_path(:char_type_id => 1, :id => 1)
end

