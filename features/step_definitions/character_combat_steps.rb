When(/^I choose two characters to combat$/) do
  visit new_char_combat_path

  expect(page).to have_content("Rogue")
  expect(page).to have_content(@user.email)

  select @char_one.title, :from => "char_combat_first_char"
  select @char_two.title, :from => "char_combat_second_char"

  click_button "Fight"
end

Then(/^I should see is the combat winner$/) do
  expect(page).to have_content("And the winner is: Rogue")
end

Given(/^I have multiple characters$/) do
  @char_one = @user.char_types.create!({ :title => "Rogue" })
  @char_two = @user.char_types.create!({ :title => "Paladin" })
  @char_three = @user.char_types.create!({ :title => "Wizard" })
  @char_four = @user.char_types.create!({ :title => "Cleric" })

  @char_one.char_attributes.create!({ :title => "Dexterity", :value => "500" })
  @char_two.char_attributes.create!({ :title => "Agility", :value => "100" })
  @char_three.char_attributes.create!({ :title => "Speed", :value => "300" })
  @char_four.char_attributes.create!({ :title => "Athletics", :value => "300" })
end

Given(/^characters have fighted before$/) do
  @combat_one = CharCombat.create!({ :winner => "Wizard", :loser => "Cleric" })
  @combat_two = CharCombat.create!({ :winner => "Cleric", :loser => "Rogue" })
  @combat_three = CharCombat.create!({ :winner => "Rogue", :loser => "Paladin" })
end

When(/^I go to combats page$/) do
  visit char_combats_path
end

Then(/^I should see combat history$/) do
  expect(page).to have_content("Fight " + @combat_one.id.to_s)
  expect(page).to have_content("Fight " + @combat_two.id.to_s)
  expect(page).to have_content("Fight " + @combat_three.id.to_s)
end

Then(/^I should see is the combat loser$/) do
  expect(page).to have_content("Loser is: Paladin")
end

Given(/^I am on combat history page$/) do
  visit char_combats_path
end

Then(/^I should see result of the fight$/) do
  expect(page).to have_content("And the winner is:")
  expect(page).to have_content("Loser is:")
end

Then(/^I shouldn't see the fight$/) do
  expect(page).to have_no_content("Fight " + @combat_one.id.to_s)
  expect(page).to have_content("Fight " + @combat_two.id.to_s)
  expect(page).to have_content("Fight " + @combat_three.id.to_s)
end



