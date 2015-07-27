Given(/^a user is signed up$/) do
  steps %Q{
    Given a valid user
    When I go to the login page
	And I fill in the following:
	  |Email|minikermit@hotmail.com|
	  |Password|12345678|
	And I press "Log in"
	Then I should see "Signed in successfully."
  }
end

When(/^I click on "(.*?)" link$/) do |link|
  first(:link, link).click
end
