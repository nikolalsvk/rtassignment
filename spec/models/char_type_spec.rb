require "rails_helper"

describe CharType do
  it { should have_db_column(:title) }
  it { should have_db_column(:avatar) }
  it { should have_db_column(:user_id) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  it { should belong_to(:user) }
  it { should have_many(:char_attributes) }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title) }
  it { should_not validate_presence_of(:avatar) }
  
  it "allows two characters with the same title" do
    CharType.create!({ :title => "Rogue" })
    char_type = CharType.new( title: "Rogue")
    
    expect(char_type).to be_valid
  end

  describe "#attack_points" do
    before do
      @char_type = CharType.new(:title => "Test")
      @char_type.char_attributes.build(:title => "Test", :value => "55")

      @char_type.save
    end

    it "should return valid attack points" do
      expect(@char_type.attack_points).to eql(56)
    end
  end

  describe "#get_combat_history" do
    before do
      @char_one = CharType.new(:title => "Test")
      @char_two = CharType.new(:title => "Testing")
      @char_three = CharType.new(:title => "Testing")

      @char_one.char_attributes.build(:title => "Test", :value => "55")
      @char_two.char_attributes.build(:title => "Testing", :value => "110")
      @char_three.char_attributes.build(:title => "Testung", :value => "20")

      @char_one.save
      @char_two.save
      @char_three.save

      @combat_one = CharCombat.create!({ :first_combatant => @char_one,
                                        :second_combatant => @char_two })
      @combat_two = CharCombat.create!({ :first_combatant => @char_two,
                                        :second_combatant => @char_one })
      @combat_three = CharCombat.create!({ :first_combatant => @char_two,
                                        :second_combatant => @char_three })
      @char_combats = [ @combat_one, @combat_two ]
    end

    it "should find characters combat history" do
      expect(@char_one.get_combat_history).to eql(@char_combats)
    end
  end
end
