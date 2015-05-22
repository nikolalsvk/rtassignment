Given(/^I am at "(.*?)" character page$/) do |title|
  visit char_type_path(@char_type)
  page.should have_content(title)
end

When(/^I fill in the form$/) do
	fill_in "Title", :with => "Dexterity"
end

Then(/^I should see the new attribute$/) do
	page.should have_content("Dexterity")
end

