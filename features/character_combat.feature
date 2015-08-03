Feature: Character combat

  Background:
    Given I am signed in

  Scenario:
    Given I have two valid characters
    When I choose two characters to combat
    Then I should see is the combat winner