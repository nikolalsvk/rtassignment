class CharCombat < ActiveRecord::Base
  validates :first_combatant, :presence => true
  validates :second_combatant, :presence => true

  before_create :combat

  def combat
    self.winner = first.attack_points > second.attack_points ? 
      first.title : second.title
    self.first_combatant = first.title
    self.second_combatant = second.title
  end

  def first
    self.first_combatant
  end

  def second
    self.second_combatant
  end
end
