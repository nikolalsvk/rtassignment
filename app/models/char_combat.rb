class CharCombat < ActiveRecord::Base
  validates :winner, :presence => true

  validates :loser, :presence => true
end
