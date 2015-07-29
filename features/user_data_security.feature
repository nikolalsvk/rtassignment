Feature: User data security

  Background: User is signed in
    Given a user is signed in

  Scenario: User tries to view someone elses character type
    When user tries to access someone elses character type
    Then user should be redirected to his character types

  Scenario: User tries to view someone elses character attributes
    When user tries to access someone elses character attributes
    Then user should be redirected to his character types
    