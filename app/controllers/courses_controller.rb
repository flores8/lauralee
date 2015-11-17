class CoursesController < ApplicationController
	before_action :set_course, only: [:show, :edit, :update, :destroy]
  # before_action :find_page, only: [:show, :edit, :update, :destroy]

  def git
	end
  def index
  	@courses = Course.all
    authorize @courses
  end

  def show
  	@lessons = @course.lessons.order("lesson_number ASC")
  	@courses = Course.all
  	authorize @course
  end

  def new
  	@course = Course.new
    authorize @course
  end

  def edit
    authorize @course
  end

  def create
  	@course = Course.new(course_params)
    authorize @course
  	if @course.save
  		redirect_to @course, notice: "Your course was created!"
  	else
  		flash[:error] = "There was a problem creating your course. Please try again."
  		render :new
  	end
  end

  def update
    authorize @course
  	if @course.update_attributes(course_params)
  		flash[:notice] = "Course was updated."
  		redirect_to @course
  	else
  		flash[:error] = "Bad news. There was a problem updating your course. Please try again."
  		render :edit
  	end
  end

  def destroy
    authorize @course
  	@course.destroy
  end

  private

  def course_params
    # binding.pry
  	params.require(:course).permit(:name)
  end

  def set_course
  	@course = Course.find_by_slug!(params[:id])
  end

  # def find_page
  #   @lesson = Lesson.find_by_slug!(params[:id])
  # end
  # helper_method :page
end