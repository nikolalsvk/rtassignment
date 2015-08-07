class CharCombatsController < ApplicationController

  before_action :find_char_combat, :only => [ :show, :destroy, :edit ]

  def index
    @char_combats = combat_history
    @combat_challenges = combat_challenges
  end

  def create
    find_first_char
    find_second_char
    
    @char_combat = CharCombat.create!({ :first_combatant => @first_char,
                                        :second_combatant => @second_char })

    redirect_to char_combat_path(@char_combat)
  end

  def new
  end

  def show
    @char_combat = CharCombat.find_by_id(params[:id])
  end

  def destroy
    @char_combat.destroy

    redirect_to char_combats_path
  end

  def edit
    find_char_type
    if @char_combat.first_combatant
      @char_combat.second_combatant = @char_type
    else
      @char_combat.first_combatant = @char_type
    end

    @char_combat.save
    redirect_to char_combat_path(@char_combat)
  end

  private
  def find_first_char
    @first_char = current_user.char_types.find_by_id(params["char_combat"]["first_char"])
  end

  def find_second_char
    @second_char = current_user.char_types.find_by_id(params["char_combat"]["second_char"])
  end

  def find_char_type
    @char_type = current_user.char_types.find_by_id(params["char_type"])
  end

  def find_char_combat
    @char_combat = CharCombat.find_by_id(params[:id])
  end

  def combat_challenges
    CharCombat.where(:challenge => true)
  end

  def combat_history
    CharCombat.where(:challenge => false)
  end
end
