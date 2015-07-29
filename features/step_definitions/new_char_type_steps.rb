Given(/^I am at new character page$/) do
  visit new_char_type_path
end

When(/^I fill in the form for adding new character$/) do
  fill_in "Title", :with => "Rogue"
end

Then(/^I should see my new character$/) do
  page.should have_content("Rogue")
end
