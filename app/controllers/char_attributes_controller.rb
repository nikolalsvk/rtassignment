class CharAttributesController < ApplicationController	
	respond_to :html, :js
	
	before_action :find_char_attribute, only: [:show, :edit, :destroy, :update]
	
	def show
		
	end

	def new
		@char_type = current_user.char_types.find(params[:char_type_id])
		@char_attribute = @char_type.char_attributes.new
	end

	def edit
		
	end

	def create
		@char_type = current_user.char_types.find(params[:char_type_id])
		@char_attribute = @char_type.char_attributes.create(char_attributes_params)
		
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
		
		redirect_to users_char_types_path
	end
	
	private
		def char_attributes_params
			params.require(:char_attribute).permit(:title, :value, :icon)
		end
		
		# improved security with this function being called before some actions
		def find_char_attribute
			@char_attribute = CharAttribute.find(params[:id])
			
			if current_user.char_types.find_by_id(@char_attribute.char_type_id).present?
				@char_attribute = current_user.char_types.find_by_id(@char_attribute.char_type_id).char_attributes.find(params[:id])
			else
				redirect_to users_char_types_path
			end
			
		end
end
