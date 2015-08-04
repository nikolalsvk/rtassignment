Feature: Character combat

  Background:
    Given I am signed in

  Scenario: Combat winner in a fight between two characters
    Given I have two valid characters
    When I choose two characters to combat
    Then I should see is the combat winner

  Scenario: View history
    Given I have multiple characters
    And they have fighted before
    When I go to combats page
    Then I should see combat history

  Scenario: Combat loser in a fight between two characters
    Given I have two valid characters
    When I choose two characters to combat
    Then I should see is the combat loser
