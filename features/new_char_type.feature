Feature: Adding a new charater type
  
  Background: User is logged in
    Given a user is signed up
    
  Scenario: Add new character
    Given I am at new character page
    When I fill in the form for adding new character
    And I click "Save Char type"
    Then I should see my new character
