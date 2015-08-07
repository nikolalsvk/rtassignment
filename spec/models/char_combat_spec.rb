require 'rails_helper'

RSpec.describe CharCombat, type: :model do
  it { should have_db_column(:winner) }
  it { should have_db_column(:first_combatant_id) }
  it { should have_db_column(:second_combatant_id) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  describe "combat validation" do
    it "combat should not be valid if both combatants are nil" do
      @char_combat = CharCombat.new(:first_combatant => nil, :second_combatant => nil)
      
      expect(@char_combat).to_not be_valid
    end
  end

  describe "#combat" do
    before do
      @char_one = CharType.new(:title => "Test")
      @char_two = CharType.new(:title => "Testing")

      @char_one.char_attributes.build(:title => "Test", :value => "55")
      @char_two.char_attributes.build(:title => "Testing", :value => "110")

      @char_one.save
      @char_two.save

      @char_combat = CharCombat.create!({ :first_combatant => @char_one,
                                        :second_combatant => @char_two })
    end

    it "should determine a winner" do
      expect(@char_combat.winner).to eql(@char_two.id)
    end
  end
end
