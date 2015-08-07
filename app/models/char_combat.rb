class CharCombat < ActiveRecord::Base

  belongs_to :first_combatant, :class_name => CharType.to_s
  belongs_to :second_combatant, :class_name => CharType.to_s

  validates :first_combatant, :presence => true, :if => lambda { second_combatant == nil }
  validates :second_combatant, :presence => true, :if => lambda { first_combatant == nil }

  before_save :open_challenge, :combat

  def open_challenge
    self.challenge = second == nil
    nil
  end

  def combat
    self.winner = first.attack_points > second.attack_points ? 
      first.id : second.id unless challenge
    nil
  end

  def first
    self.first_combatant
  end

  def second
    self.second_combatant
  end
end
