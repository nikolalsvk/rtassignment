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
    
  scope :by_title, -> { order("title") }
end
