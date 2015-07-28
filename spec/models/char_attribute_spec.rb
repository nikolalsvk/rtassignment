require "spec_helper"
require "rails_helper"

describe CharAttribute do
	it { should belong_to(:char_type) }
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:value) }
		
	it "can upload a small picture" do
		char_attribute = CharAttribute.new( icon: fixture_file_upload('files/rogue_test.png', 'image/png') )
		icon = char_attribute.icon
		icon.should_not be_nil
	end
end
