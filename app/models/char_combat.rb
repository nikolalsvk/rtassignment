class CharCombat < ActiveRecord::Base

  belongs_to :first_combatant, :class_name => CharType.to_s
  belongs_to :second_combatant, :class_name => CharType.to_s

  validates :first_combatant, :presence => true
  validates :second_combatant, :presence => true

  before_create :combat

  def combat
    self.winner = first.attack_points > second.attack_points ? 
      first.id : second.id
  end

  def first
    self.first_combatant
  end

  def second
    self.second_combatant
  end
end
