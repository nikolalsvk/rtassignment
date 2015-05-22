Feature: Adding new character attribute

	Background: User logs in
		Given a valid user
		When I go to the login page
		And I fill in the following:
		  |Email|minikermit@hotmail.com|
		  |Password|12345678|
		And I press "Log in"
		Then I should see "Signed in successfully."
		
	Scenario: Add new character attribute
		Given there's a character type named "Rogue"
		And I am at "Rogue" character page
		When I fill in the form
		And I click "Create Char attribute"
		Then I should see the new attribute
