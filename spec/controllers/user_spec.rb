require "spec_helper"
require "rails_helper"

describe "log in" do
  it "allows an existing user to sign in" do
    skip "user create"
    User.create!({
       :email => "minikermit@hotmail.com",
       :password => "12345678",
       :password_confirmation => "12345678"
       })

    visit "/users/sign_in"

    fill_in "Email", with: "minikermit@hotmail.com"
    fill_in "Password", with: "12345678"

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end
end
