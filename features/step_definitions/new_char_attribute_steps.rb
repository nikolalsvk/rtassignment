Given(/^I am at "(.*?)" character page$/) do |title|
 visit char_type_path(@char_type)
 page.should have_content(title)
end

When(/^I fill in the form$/) do
 fill_in "Title", :with => "Dexterity"
 fill_in "Value", :with => "10"
end

Then(/^I should see the new attribute$/) do
 page.should have_content("Dexterity")
end

Given(/^character type Rogue has an attribute "(.*?)"$/) do |attribute|
 @char_type.char_attributes.create!({ :title => attribute, :value => '10' })
end

When(/^I fill in "(.*?)"$/) do |attribute_title|
 fill_in "Title", :with => attribute_title
end

Then(/^I should see "(.*?)" attribute$/) do |attribute|
 page.should have_content(attribute)
end

Then(/^I shouldn't see "(.*?)" attribute$/) do |attribute|
 page.should have_no_content(attribute)
end





