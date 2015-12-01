class LessonsController < ApplicationController
	before_action :set_lesson, :set_course, only: [:show, :edit, :update, :destroy]


  def index
  	@lessons = Lesson.all.order("lesson_number ASC")
    authorize @lessons
  end

  def show
  	@lessons = Lesson.all
  end

  def new
    @course = Course.find_by_slug!(params[:course_id])
    @courses = Course.all
  	@lesson = Lesson.new
    authorize @lesson
  end

  def edit
    authorize @lesson
  end

  def create
    @course = Course.find_by_slug(params[:course_id])
  	@lesson = Lesson.new(lesson_params)
    @lesson.complete = false
    @lesson.course = @course
    authorize @lesson
  	if @lesson.save
  		redirect_to [@course, @lesson], notice: "Your lesson was created!"
  	else
  		render action: 'new'
  	end
  end

  def update
    authorize @lesson
  	if @lesson.update_attributes(lesson_params)
  		flash[:notice] = "Lesson was updated."
  		redirect_to [@course, @lesson]
  	else
  		flash[:error] = "Bad news. There was a problem updating your lesson. Please try again."
  		render :edit
  	end
  end

  def destroy
    authorize @lesson
  	@lesson.destroy
    redirect_to course_url
  end

  private

  def lesson_params
    # binding.pry
  	params.require(:lesson).permit(:title, :body, :lesson_number, :slug, :description)
  end

  def set_lesson
  	@lesson = Lesson.find_by_slug!(params[:id])
  end

  def set_course
    @course = Course.find_by_slug!(params[:course_id])
  end
end
