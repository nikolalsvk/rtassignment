class CharType < ActiveRecord::Base
  mount_uploader :avatar, PictureUploader
  belongs_to :user
  has_many :char_attributes, :dependent => :destroy
  has_many :char_combats

  validates :title, :presence => true, :length => { :minimum => 3 }

  before_destroy :destroy_char_combat_history

  scope :by_title, -> { order("title") }

  def attack_points
    attr_sum = 0;

    self.char_attributes.each do |attribute|
      attr_sum += attribute.value
    end

    attr_sum / self.char_attributes.count + self.char_attributes.count
  end

  def destroy_char_combat_history
    CharCombat.delete_all
  end

  def combats
    CharCombat.where("first_combatant_id != ? OR second_combatant_id != ?",
                     self, self)
  end

  def challenges
    combats.where(:challenge => true)
  end

  def combat_history
    combats.where(:challenge => false)
  end
end
