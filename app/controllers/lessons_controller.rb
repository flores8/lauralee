class LessonsController < ApplicationController
	before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :find_page, only: [:show, :edit, :update, :destroy]

  def index
  	@lessons = Lesson.all.order("lesson_number ASC")
    authorize @lessons
  end

  def show
  	@lessons = Lesson.all
  	@next_lesson = @lessons.where(lesson_number: @lesson.next_lesson).first
  	@previous_lesson = @lessons.where(lesson_number: @lesson.previous_lesson).first
  end

  def new
  	@lesson = Lesson.new
    authorize @lesson
  end

  def edit
    authorize @lesson
  end

  def create
  	@lesson = Lesson.new(lesson_params)
    @lesson.complete = false
    authorize @lesson
  	if @lesson.save
  		redirect_to @lesson, notice: "Your lesson was created!"
  	else
  		render action: 'new'
  	end
  end

  def update
    authorize @lesson
  	if @lesson.update_attributes(lesson_params)
  		flash[:notice] = "Lesson was updated."
  		redirect_to @lesson
  	else
  		flash[:error] = "Bad news. There was a problem updating your lesson. Please try again."
  		render :edit
  	end
  end

  def destroy
    authorize @lesson
  	@lesson.destroy
  end

  private

  def lesson_params
    # binding.pry
  	params.require(:lesson).permit(:title, :body, :lesson_number, :slug, :description)
  end

  def set_lesson
  	@lesson = Lesson.find_by_slug!(params[:id])
  end

  def find_page
    @lesson = Lesson.find_by_slug!(params[:id])
  end
  helper_method :page
end
