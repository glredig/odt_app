class VideoLessonsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :create, :update, :destroy]
  
  def index
    @video_lessons = VideoLesson.all
  end

  def show
    @video_lesson = VideoLesson.find(params[:id])
  end

  def new
    @video_lesson = VideoLesson.new
  end

  def edit
    @video_lesson = VideoLesson.find(params[:id])
  end

  def create
    @video_lesson = VideoLesson.new(params[:video_lesson])

    if @video_lesson.save
      redirect_to @video_lesson, success: 'Video lesson was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @video_lesson = VideoLesson.find(params[:id])

    if @video_lesson.update_attributes(params[:video_lesson])
      redirect_to @video_lesson, success: 'Video lesson was successfully updated.'
    else
      render action: "edit" 
    end

  end

  def destroy
    @video_lesson = VideoLesson.find(params[:id])
    @video_lesson.destroy

    redirect_to video_lessons_url 
    head :no_content 
  end
end
