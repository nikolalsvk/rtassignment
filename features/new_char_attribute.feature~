Feature: Adding and editing new character attribute

	Background: User logs in
		Given a valid user
		And there's a character type named "Rogue"
		When I go to the login page
		And I fill in the following:
		  |Email|minikermit@hotmail.com|
		  |Password|12345678|
		And I press "Log in"
		Then I should see "Signed in successfully."
		
	Scenario: Add new character attribute
		Given I am at "Rogue" character page
		When I fill in the form
		And I click "Create Char attribute"
		Then I should see the new attribute
		
	Scenario: Edit characters attribute
		Given character type Rogue has an attribute "Dexterity"
		And I am at "Rogue" character page
		When I click on "Edit" link
		And I fill in "Athletics"
		And I click "Update Char attribute"
		Then I should see "Athletics" attribute
	
	@javascript
	Scenario: Destroy characters attribute
		Given character type Rogue has an attribute "Dexterity"
		And I am at "Rogue" character page
		When I click on "Destroy" link
		And I click "OK" button
		Then I shouldn't see "Dexterity" attribute
