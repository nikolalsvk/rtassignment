class CharCombatsController < ApplicationController

  before_action :find_char_combat, :only => [ :show, :destroy ]

  def index
    @char_combats = CharCombat.all
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

  private
  def find_first_char
    @first_char = current_user.char_types.find_by_id(params["char_combat"]["first_char"])
  end

  def find_second_char
    @second_char = current_user.char_types.find_by_id(params["char_combat"]["second_char"])
  end

  def find_char_combat
    @char_combat = CharCombat.find_by_id(params[:id])
  end
end
