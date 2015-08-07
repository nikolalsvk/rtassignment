Given(/^there is open challenge$/) do
  @combat = CharCombat.create!({ :first_combatant => @char_one })
end

When(/^I go to my character page$/) do
  visit char_type_path(@char_two)
end

Then(/^I should see open challenge$/) do
  expect(page).to have_content("Challenge " + @combat.id.to_s)
end

Then(/^I should see who won the challenge$/) do
  expect(page).to have_content("And the winner is:")
  expect(page).to have_content("Loser is:")
end

