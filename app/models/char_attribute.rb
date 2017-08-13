class CharAttribute < ActiveRecord::Base
  mount_uploader :icon, PictureUploader
  belongs_to :char_type

  validates :title, :presence => true,
                    :length => { :minimum => 3 }

  validates :value, :presence => true,
                    :numericality => { :greater_than_or_equal_to => 0 }

  scope :by_title, -> { order("title") }
end
