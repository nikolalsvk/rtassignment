# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  @char_one = @user.char_types.create!({ :title => "Rogue" })
  @char_two = @user.char_types.create!({ :title => "Paladin" })
  @char_three = @user.char_types.create!({ :title => "Wizard" })
  @char_four = @user.char_types.create!({ :title => "Cleric" })

  @char_one.char_attributes.create!({ :title => "Dexterity", :value => "500" })
  @char_two.char_attributes.create!({ :title => "Agility", :value => "100" })
  @char_three.char_attributes.create!({ :title => "Speed", :value => "300" })
  @char_four.char_attributes.create!({ :title => "Athletics", :value => "300" })

  @combat_one = CharCombat.create!({ :first_combatant => @char_three, :second_combatant => @char_four })
  @combat_two = CharCombat.create!({ :first_combatant => @char_four, :second_combatant => @char_one })
  @combat_three = CharCombat.create!({ :first_combatant => @char_one, :second_combatant => @char_two })
