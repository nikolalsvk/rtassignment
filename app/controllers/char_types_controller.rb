class CharTypesController < ApplicationController
  before_action :find_char_type, :only => [ :show, :edit, :update, :destroy ]

  def index
    @char_types = current_user.char_types.by_title.page(params[:page]).per(4)
  end

  def show
  end

  def new
    @char_type = current_user.char_types.new
  end

  def edit
  end

  def create
    @char_type = current_user.char_types.new(char_type_params)

    if @char_type.save
      redirect_to char_type_path(@char_type)
    else
      render 'new'
    end
  end

  def update
    if @char_type.update(char_type_params)
      redirect_to char_type_path(@char_type)
    else
      render 'edit'
    end
  end

  def destroy
    @char_type.destroy

    redirect_to char_types_path
  end

  private
  def char_type_params
    params.require(:char_type).permit(:title, :avatar)
  end

  def find_char_type
    @char_type = current_user.char_types.find_by_id(params[:id])
  end
end
