class HomeController < ApplicationController
  def index
	@blogposts = Blogpost.all
	@video_lessons = VideoLesson.all
  end
end
