require "spec_helper"
require "rails_helper"

describe CharAttribute do
  it { should have_db_column(:title) }
  it { should have_db_column(:value) }
  it { should have_db_column(:icon) }
  it { should have_db_column(:char_type_id) } 
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  it { should belong_to(:char_type) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title) }
  it { should validate_presence_of(:value) }
  it { should validate_numericality_of(:value) }
  it { should_not validate_presence_of(:icon)}
    
  it "can upload a small picture" do
    char_attribute = CharAttribute.new( icon: fixture_file_upload('files/rogue_test.png', 'image/png') )
    icon = char_attribute.icon
    expect(icon).not_to be_nil
  end
end
