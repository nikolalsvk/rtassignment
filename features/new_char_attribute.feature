Feature: Adding new character attribute

  Background: User logs in
    Given a user is signed in
    And there's a character type named "Rogue"
    And character type Rogue has an attribute "Dexterity"
    And I am at "Rogue" character page
    
  Scenario: Add new character attribute
    When I click on "Add more attributes" link
    And I fill in the form
    And I click "Create Char attribute"
    Then I should see the new attribute
    
