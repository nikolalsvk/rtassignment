require "spec_helper"
require "rails_helper"

describe CharAttribute do
	it { should belong_to(:char_type) }
	it

	it "should have title" do
		char_attribute = CharAttribute.new
		char_attribute.should validate_presence_of(:title)
	end
	
	it "should have value" do
		char_attribute = CharAttribute.new
		char_attribute.should validate_presence_of(:value)
	end
	
	it "is valid with title and value" do
		char_attribute = CharAttribute.new( title: "Dexterity", value: 10)
		expect(char_attribute).to be_valid
	end
	
	it "is not valid without value" do
		char_attribute = CharAttribute.new( title: "Dexterity")
		expect(char_attribute).to_not be_valid
	end
	
	it "is not valid without title" do
		char_attribute = CharAttribute.new( value: 5 )
		expect(char_attribute).to_not be_valid
	end
	
	it "can upload a small picture" do
		char_attribute = CharAttribute.new( icon: fixture_file_upload('files/rogue_test.png', 'image/png') )
		icon = char_attribute.icon
		icon.should_not be_nil
	end	
end
