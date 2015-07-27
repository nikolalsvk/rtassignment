Given(/^there's a character type named "(.*?)"$/) do |title|
	user = User.find_by_email("minikermit@hotmail.com")
  @char_type = user.char_types.create!({ :title => title })
end


When(/^I am on the character types page$/) do
  visit users_char_types_path
end

Then(/^I should see the "(.*?)" character$/) do |title|
  @char_type = CharType.find_by_title(title)

  page.should have_content(@char_type.title)
end

When(/^I click "(.*?)" button$/) do |button|
	page.evaluate_script('window.confirm = function() { return true; }')
end


Then(/^I should see the "(.*?)" in detail$/) do |title|
  page.should have_content(title)
  page.should have_content("Character")
end

Then(/^I shouldn't see the "(.*?)" character$/) do |title|
  page.should have_no_content(title)
end

Then(/^I should see the "(.*?)" edit page$/) do |arg1|
  page.should have_content(title)
  page.should have_content("Edit")
end




