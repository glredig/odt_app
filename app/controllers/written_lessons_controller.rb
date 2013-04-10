class WrittenLessonsController < ApplicationController
  def index
    @written_lessons = WrittenLesson.all
  end

  def show
    @written_lesson = WrittenLesson.find(params[:id])
    @images = Image.where(written_lesson_id: params[:id])
  end

  def new
    @written_lesson = WrittenLesson.new
  end

  def edit
    @written_lesson = WrittenLesson.find(params[:id])
  end

  def create
    @written_lesson = WrittenLesson.new(params[:written_lesson])

      if @written_lesson.save
        redirect_to @written_lesson, notice: 'Written lesson was successfully created.' 
      else
        render action: "new" 
      end
  end

  def update
    @written_lesson = WrittenLesson.find(params[:id])

    if @written_lesson.update_attributes(params[:written_lesson])
      redirect_to @written_lesson, notice: 'Written lesson was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @written_lesson = WrittenLesson.find(params[:id])
    @written_lesson.destroy
  end
end
