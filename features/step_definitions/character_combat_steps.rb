Given(/^I have two valid characters$/) do
  @char_one = @user.char_types.create!({ :title => "Rogue" })
  @char_two = @user.char_types.create!({ :title => "Paladin" })

  @char_one.char_attributes.create!({ :title => "Dexterity", :value => "500" })
  @char_two.char_attributes.create!({ :title => "Agility", :value => "100" })
end

When(/^I choose two characters to combat$/) do
  visit new_char_combat_path

  expect(page).to have_content("Rogue")
  expect(page).to have_content(@user.email)

  select @char_one.title, :from => "char_combat_first_char"
  select @char_two.title, :from => "char_combat_second_char"

  click_button "Fight"
end

Then(/^I should see is the combat winner$/) do
  expect(page).to have_content("Rogue")
end
