class CharType < ActiveRecord::Base
	mount_uploader :avatar, PictureUploader
	belongs_to :user
	has_many :char_attributes
	
	validates :title, presence: true
end
