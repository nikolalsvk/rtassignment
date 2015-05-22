Feature: Home page
	
	Background: User logs in
		Given a valid user
		When I go to the login page
		And I fill in the following:
		  |Email|minikermit@hotmail.com|
		  |Password|12345678|
		And I press "Log in"
		Then I should see "Signed in successfully."
	
	Scenario: View my "Rogue" character
		Given there's a character type named "Rogue"
		When I am on the character types page
		Then I should see the "Rogue" character
		
	Scenario: Show my "Rogue" character
		Given there's a character type named "Rogue"
		When I am on the character types page
		And I click on "Show" link
		Then I should see the "Rogue" in detail
	
	@javascript
	Scenario: Destroy my "Rogue" character
		Given there's a character type named "Rogue"
		When I am on the character types page
		And I click on "Destroy" link
		And I click "OK" button
		Then I shouldn't see the "Rogue" character
		
	Scenario: Show edit page of my "Rogue" character
		Given there's a character type named "Rogue"
		When I am on the character types page
		And I click on "Edit" link
		Then I should see the "Rogue" edit page
