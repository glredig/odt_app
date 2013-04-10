class Image < ActiveRecord::Base
	attr_accessible :image
	belongs_to :written_lesson

	mount_uploader :image, ImageUploader
end