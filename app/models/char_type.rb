class CharType < ActiveRecord::Base
	require 'file_size_validator' 
	
	mount_uploader :avatar, PictureUploader
	belongs_to :user
	has_many :char_attributes, dependent: :destroy
	
	validates :title, presence: true,
										length: { minimum: 3 }
										
	validates :avatar, 
		:file_size => {
			:maximum => 1.0.megabytes.to_i
		}
		
	def file_size
    if file.file.size.to_f/(1000*1000) > user.product_upload_limit.to_f
      errors.add(:file, "You cannot upload a file greater than #{upload_limit.to_f}MB")
    end	
  end
end
