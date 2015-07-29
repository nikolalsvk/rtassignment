class CharAttribute < ActiveRecord::Base
  require 'file_size_validator' 

  mount_uploader :icon, PictureUploader
  belongs_to :char_type
  
  validates :title, presence: true,
                    :length => { :minimum => 3 }
                    
  validates :value, presence: true,
                    :numericality => { :greater_than_or_equal_to => 0 }
  
  validates :icon,
    :file_size => {
      :maximum => 0.5.megabytes.to_i
    }
end
