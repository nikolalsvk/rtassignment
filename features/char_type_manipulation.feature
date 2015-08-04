Feature: Character type manipulation

  Background: User is logged in and on page
    Given I am signed in
    And there's a character type named "Rogue"
    When I am on the character types page

  Scenario: Show my "Rogue" character
    When I click on "Show" link
    Then I should see the "Rogue" in detail

  @javascript
  Scenario: Destroy my "Rogue" character
    When I click on "Destroy" link
    And I click "OK" button
    Then I shouldn't see the "Rogue" character

  Scenario: Show edit page of my "Rogue" character
    When I click on "Edit" link
    Then I should see the "Rogue" edit page
