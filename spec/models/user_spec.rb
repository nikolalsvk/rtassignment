require "rails_helper"

describe User do
  it { should have_db_column(:email) }
  it { should have_db_column(:encrypted_password) }
  it { should have_db_column(:reset_password_token) }
  it { should have_db_column(:reset_password_sent_at) }
  it { should have_db_column(:remember_created_at) }
  it { should have_db_column(:sign_in_count) }
  it { should have_db_column(:current_sign_in_at) }
  it { should have_db_column(:last_sign_in_at) }
  it { should have_db_column(:current_sign_in_ip) }
  it { should have_db_column(:last_sign_in_ip) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  it { should have_many(:char_types) }

  it "is invalid with a duplicate email address" do
     User.create!({ :email => "minikermit@hotmail.com",
                    :password => "12345678",
                    :password_confirmation => "12345678" })
          
     user = User.new({ :email => "minikermit@hotmail.com",
                       :password => "testtest",
                       :password_confirmation => "testtest" })
          
     expect(user).to_not be_valid
  end
end
