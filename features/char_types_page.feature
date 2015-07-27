Feature: Home page
	
	Background: logs User in
	  	Given a user is signed up
		
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
