Feature: Adding new charater type
	
	Background: User logs in
		Given a valid user
		When I go to the login page
		And I fill in the following:
		  |Email|minikermit@hotmail.com|
		  |Password|12345678|
		And I press "Log in"
		Then I should see "Signed in successfully."
		
	Scenario: Add new character
		Given I am at new character page
		When I fill in the form for adding new character
		And I click "Save Char type"
		Then I should see my new character
		
	
