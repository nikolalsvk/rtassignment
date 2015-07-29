class CharAttributesController < ApplicationController  
  respond_to :html, :js

  before_action :find_char_type, :only => [ :show, :edit, :destroy, :new, :create, :update ]
  before_action :find_char_attribute, :only => [ :show, :edit, :destroy, :update ]
  
  def show
  end

  def new
    @char_type = current_user.char_types.find(params[:char_type_id])
    @char_attribute = @char_type.char_attributes.new
  end

  def edit
  end

  def create
    @char_attribute = @char_type.char_attributes.build(char_attributes_params)

    if @char_attribute.save
      redirect_to char_type_path(@char_type)
    else
      render 'new'
    end
  end

  def update
    if @char_attribute.update(char_attributes_params)
      redirect_to char_type_path(@char_attribute.char_type)
    else
      render 'edit'
    end
  end

  def destroy
    @char_attribute.destroy

    redirect_to char_types_path
  end

  private
  def char_attributes_params
    params.require(:char_attribute).permit(:title, :value, :icon)
  end

  def find_char_type
    @char_type = current_user.char_types.find_by_id(params[:char_type_id])
    render 'public/404' unless @char_type
  end

  # TODO refactor
  # improved security with this function being called before some actions
  def find_char_attribute
    if @char_type.present?
      @char_attribute = @char_type.char_attributes.find_by_id(params[:id])
      render 'public/404' unless @char_attribute
    else
      redirect_to char_types_path
    end
  end
end
