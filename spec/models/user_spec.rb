require "spec_helper"
require "rails_helper"

describe User do
	it { should have_many(:char_types) }

	it "is invalid with a duplicate email address" do
		 User.create!({
             :email => "minikermit@hotmail.com",
             :password => "12345678",
             :password_confirmation => "12345678"
          })
          
     user = User.new({
     				 :email => "minikermit@hotmail.com",
             :password => "testtest",
             :password_confirmation => "testtest"
          })
          
     expect(user).to_not be_valid
  end
end
