class CharAttributesController < ApplicationController
	def edit
		@char_attribute = CharAttribute.find(params[:id])
	end

	def create
		@char_type = CharType.find(params[:char_type_id])
		@char_attribute = @char_type.char_attributes.create(char_attributes_params)
		
		redirect_to char_type_path(@char_type)
	end
	
	def update
		@char_attribute = CharAttribute.find(params[:id])
		@char_type = CharType.find(@char_attribute.char_type_id)
		
		if @char_attribute.update(char_attributes_params)
			redirect_to char_type_path(@char_type)
		else
			render 'edit'
		end
	end
	
	def destroy
		@char_attribute = CharAttribute.find(params[:id])
		@char_type = CharType.find(@char_attribute.char_type_id)
		@char_attribute.destroy
		
		redirect_to users_char_types_path
	end
	
	private
		def char_attributes_params
			params.require(:char_attribute).permit(:title, :value, :icon)
		end
		
		def find_char_attribute
			@char_attribute = CharAttribute.find(params[:id])
		end
end
