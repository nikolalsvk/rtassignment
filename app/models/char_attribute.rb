class CharAttribute < ActiveRecord::Base
	mount_uploader :icon, PictureUploader
  belongs_to :char_type
end
