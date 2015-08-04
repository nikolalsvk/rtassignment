class CharCombatsController < ApplicationController

  def index
    @char_combats = CharCombat.all
  end

  def create
    find_first_char
    find_second_char
    
    @char_combat = CharCombat.create!(who_won(combat))

    redirect_to char_combat_path(@char_combat)
  end

  def new
  end

  def show
    @char_combat = CharCombat.find_by_id(params[:id])
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

  def who_won(winner)
    winner == @first_char ? { :winner => @first_char.title, :loser => @second_char.title } :
                            { :winner => @second_char.title, :loser => @first_char.title }
  end
end
