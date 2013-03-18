class VideoLesson < ActiveRecord::Base
  attr_accessible :description, :title, :video, :remote_video_url
  validates_presence_of :title
  validates_presence_of :description

  mount_uploader :video, VideoUploader

  def video_name 
  	File.basename(video.path || video.filename) if video
  end
end
