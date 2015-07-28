#require File.expand_path(File.dirname(__FILE__) + "/../../app/models/user")

Given /^a valid user$/ do
  @user = User.create!({
             :email => "minikermit@hotmail.com",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
end

When(/^I go to the login page$/) do
	visit user_session_path
end

When(/^I fill in the following:$/) do |table|
  # table is a Cucumber::Ast::Table
  fill_in "Email", :with => "minikermit@hotmail.com"
  fill_in "Password", :with => "12345678"
end

When(/^I press "(.*?)"$/) do |button|
	click_button button
end
