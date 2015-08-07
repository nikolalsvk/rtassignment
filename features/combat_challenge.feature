Feature: Combat challenges

  Background:
    Given I am signed in
    And I have multiple characters
    And there is open challenge

  Scenario: I view open challenge
    When I go to my character page
    Then I should see open challenge

  Scenario: I join open challenge
    When I go to my character page
    And I click on "Join" link
    Then I should see who won the challenge
    