Feature: User restrictions while not signed in

	Background:
		Given I visit index page
		And I am not signed in

	Scenario: User tries to view character types
		When I try to view character types
		Then I should see "You need to sign in or sign up before continuing."

	Scenario: User tries to view specific character type
		When I try to view specific character type
		Then I should see "You need to sign in or sign up before continuing."

	Scenario: User tries to view specific character attribute
		When I try to view specific character attribute
		Then I should see "You need to sign in or sign up before continuing."