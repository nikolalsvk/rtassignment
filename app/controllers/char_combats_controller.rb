class CharCombatsController < ApplicationController

  def index
  end

  def create
    first_char = current_user.char_types.find_by_id(params["char_combat"]["first_char"])
    second_char = current_user.char_types.find_by_id(params["char_combat"]["second_char"])

    if combat_algorithm(first_char, second_char) == first_char
      @char_combat = CharCombat.new(:winner => first_char.title,
                                                   :loser => second_char.title)
    else
      @char_combat = CharCombat.new(:winner => second_char.title,
                                                   :loser => first_char.title)
    end

    @char_combat.save
    # byebug
    redirect_to char_combat_path(@char_combat)
  end

  def show
    @char_combat = CharCombat.find_by_id(params[:id])
  end

  private
  def attribute_sum(char_type)
    attr_sum = 0;
    
    char_type.char_attributes.each do |attribute|
      attr_sum += attribute.value
    end

    attr_sum
  end

  def combat(sum, count)
    sum / count + count
  end

  def combat_algorithm(first_char, second_char)
    first_attr_sum = attribute_sum(first_char)
    second_attr_sum = attribute_sum(second_char)

    # byebug

    if combat(first_attr_sum, first_char.char_attributes.count) >
       combat(second_attr_sum, second_char.char_attributes.count)
      first_char
    else
      second_char
    end
  end

end
