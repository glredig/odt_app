class Video < ActiveRecord::Base
	attr_accessible :video, :video_url, :video_format, :tasks_attributes
	belongs_to :video_lesson

    mount_uploader :video, VideoUploader

    scope :mp4_format, where(video_format: 'MP4')
    scope :ogg_format, where(video_format: 'OGG')

	def video_name 
  		File.basename(video.path || video.filename) if video
  	end
end