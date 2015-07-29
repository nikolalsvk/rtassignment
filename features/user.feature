Feature: User login and logout

  Background: Login
    Given a valid user
    When I go to the login page
    And I fill in the following:
      |Email|minikermit@hotmail.com|
      |Password|12345678|
    And I press "Log in"
    Then I should see "Signed in successfully."
    
  Scenario: Logout
    When I click on "Logout" link
    Then I should see "Signed out successfully."
