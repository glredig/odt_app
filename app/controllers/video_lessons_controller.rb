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

    respond_to do |format|
      if @video_lesson.save
        format.html { redirect_to @video_lesson, notice: 'Video lesson was successfully created.' }
        format.json { render json: @video_lesson, status: :created, location: @video_lesson }
      else
        format.html { render action: "new" }
        format.json { render json: @video_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video_lessons/1
  # PUT /video_lessons/1.json
  def update
    @video_lesson = VideoLesson.find(params[:id])

    respond_to do |format|
      if @video_lesson.update_attributes(params[:video_lesson])
        format.html { redirect_to @video_lesson, notice: 'Video lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_lessons/1
  # DELETE /video_lessons/1.json
  def destroy
    @video_lesson = VideoLesson.find(params[:id])
    @video_lesson.destroy

    respond_to do |format|
      format.html { redirect_to video_lessons_url }
      format.json { head :no_content }
    end
  end
end
