class CharCombatsController < ApplicationController

  def index
  end

  def create
    find_first_char
    find_second_char
    
    @winner = combat.title

    redirect_to char_combats_path(:winner => @winner)
  end

  def new
  end

  private
  def combat
    @first_char.attack_points > @second_char.attack_points ? @first_char : @second_char
  end

  def find_first_char
    @first_char = current_user.char_types.find_by_id(params["char_combat"]["first_char"])
  end

  def find_second_char
    @second_char = current_user.char_types.find_by_id(params["char_combat"]["second_char"])
  end
end
