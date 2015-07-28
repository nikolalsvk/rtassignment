Given(/^I am not signed in$/) do
  page.should have_no_content("Logged in as")
end

Given(/^I visit index page$/) do
  visit root_path
end

When(/^I try to view character types$/) do
  click_link "All characters"
end

When(/^I try to view specific character type$/) do
  visit char_type_path(:id => 1)
end

When(/^I try to view specific character attribute$/) do
  visit char_type_char_attribute_path(:char_type_id => 1, :id => 1)
end