Feature: Character attribute manipulation

	Background: User logs in
		Given a user is signed up
		And there's a character type named "Rogue"
		And character type Rogue has an attribute "Dexterity"
		And I am at "Rogue" character page

	Scenario: Edit characters attribute
		When I click on "Edit" link
		And I fill in "Athletics"
		And I click "Update Char attribute"
		Then I should see "Athletics" attribute
	
	@javascript
	Scenario: Destroy characters attribute
		When I click on "Destroy" link
		And I click "OK" button
		Then I shouldn't see "Dexterity" attribute