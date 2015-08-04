class CharType < ActiveRecord::Base
  require 'file_size_validator' 
  
  mount_uploader :avatar, PictureUploader
  belongs_to :user
  has_many :char_attributes, :dependent => :destroy
  
  validates :title, :presence => true,
                    :length => { :minimum => 3 }
                    
  validates :avatar, 
    :file_size => {
      :maximum => 1.0.megabytes.to_i
    }
    
  scope :by_title, -> { order("title") }

  def attack_points
    attr_sum = 0;
    
    self.char_attributes.each do |attribute|
      attr_sum += attribute.value
    end

    attr_sum / self.char_attributes.count + self.char_attributes.count
  end
end
