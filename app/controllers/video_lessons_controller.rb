class VideoLessonsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :create, :update, :destroy]
  
  def index
    @video_lessons = VideoLesson.all
    @uploader = VideoLesson.new.video
    @uploader.success_action_redirect = new_video_lesson_url
  end

  def show
    @video_lesson = VideoLesson.find(params[:id])
  end

  def new
    @video_lesson = VideoLesson.new(key: params[:key])
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

  # PUT /video_lessons/1
  # PUT /video_lessons/1.json
  def update
    @video_lesson = VideoLesson.find(params[:id])

    if @video_lesson.update_attributes(params[:video_lesson])
      redirect_to @video_lesson, success: 'Video lesson was successfully updated.'
    else
      render action: "edit" 
    end

  end

  # DELETE /video_lessons/1
  # DELETE /video_lessons/1.json
  def destroy
    @video_lesson = VideoLesson.find(params[:id])
    @video_lesson.destroy

    redirect_to video_lessons_url 
    head :no_content 
  end
end
