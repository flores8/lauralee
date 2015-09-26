class LessonsController < ApplicationController
	before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :find_page, only: [:show, :edit, :update, :destroy]

  def index
  	@lessons = Lesson.all.order("lesson_number ASC")
  end

  def show
  	@lessons = Lesson.all
    # binding.pry
  	@next_lesson = @lessons.where(lesson_number: @lesson.next_lesson)
  	@previous_lesson = @lessons.where(lesson_number: @lesson.previous_lesson)
  end

  def new
  	@lesson = Lesson.new
  end

  def edit
  end

  def create
  	@lesson = Lesson.new(lesson_params)
  	if @lesson.save
  		redirect_to @lesson, notice: "Your lesson was created!"
  	else
  		render action: 'new'
  	end
  end

  def update
  	if @lesson.update_attributes(lesson_params)
  		flash[:notice] = "Lesson was updated."
  		redirect_to @lesson
  	else
  		flash[:error] = "Bad news. There was a problem updating your lesson. Please try again."
  		render :edit
  	end
  end

  def destroy
  	@lesson.destroy
  end

  private

  def lesson_params
  	params.require(:lesson).permit(:title, :body, :lesson_number, :slug)
  end

  def set_lesson
  	@lesson = Lesson.find_by_slug!(params[:id])
  end

  def find_page
    @lesson = Lesson.find_by_slug!(params[:id])
  end
  helper_method :page
end
