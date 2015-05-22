class CharAttribute < ActiveRecord::Base
	require 'file_size_validator' 

	mount_uploader :icon, PictureUploader
  belongs_to :char_type
  
  validates :icon,
  	:file_size => {
			:maximum => 0.5.megabytes.to_i
		}
end
