class VideoLesson < ActiveRecord::Base
  attr_accessible :description, :title, :video, :remote_video_url
  validates_presence_of :title

  mount_uploader :video, VideoUploader
end
