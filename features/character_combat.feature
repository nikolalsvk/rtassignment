Feature: Character combat

  Background:
    Given I am signed in
    And I have multiple characters

  Scenario: Combat winner in a fight between two characters
    When I choose two characters to combat
    Then I should see is the combat winner

  Scenario: View combat history of all characters
    Given I have multiple characters
    And characters have fighted before
    When I go to combats page
    Then I should see combat history

  Scenario: Combat loser in a fight between two characters
    When I choose two characters to combat
    Then I should see is the combat loser

  Scenario: Clickable combat history table
    Given characters have fighted before
    And I am on combat history page
    When I click on "Show" link
    Then I should see result of the fight

  Scenario: Delete fight from history
    Given characters have fighted before
    And I am on combat history page
    When I click on "Destroy" link
    Then I shouldn't see the fight
