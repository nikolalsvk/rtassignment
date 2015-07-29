Feature: User sign up

  Scenario: User signs up
    Given user is on sign up form
    When user fills out sign up form
    Then user should be registered
