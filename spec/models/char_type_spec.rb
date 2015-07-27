require "spec_helper"
require "rails_helper"

describe CharType do
	it { should belong_to(:user) }
	it { should have_many(:char_attributes) }
	it { should validate_presence_of(:title) }
	it { should_not validate_presence_of(:avatar) }
	
	it "allows two characters with the same title" do
		CharType.create!({ :title => "Rogue" })
		char_type = CharType.new( title: "Rogue")
		
		expect(char_type).to be_valid
	end
end
