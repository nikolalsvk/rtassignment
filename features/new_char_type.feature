Feature: Adding a new charater type
  
  Background: User is logged in
    Given I am signed in
    
  Scenario: Add new character
    Given I am at new character page
    When I fill in the form for adding new character
    And I click "Submit character type"
    Then I should see my new character

