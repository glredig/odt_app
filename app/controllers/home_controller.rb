class HomeController < ApplicationController
  def index
	@blogposts = Blogpost.all
	@video_lessons = VideoLesson.all
	@news_items = NewsItem.all
  end
end
