When(/^I visit characters page$/) do
  visit char_type_path(@char_one)
end

Then(/^I should see characters combat history$/) do
  expect(page).to have_content("Fight " + @combat_two.id.to_s)
  expect(page).to have_content("Fight " + @combat_three.id.to_s)
end
