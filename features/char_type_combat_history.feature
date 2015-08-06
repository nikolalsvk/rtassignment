Feature: Character combat history

  Background:
    Given I am signed in

  Scenario: View character combat history
    Given I have multiple characters
    And characters have fighted before
    When I visit characters page
    Then I should see characters combat history
