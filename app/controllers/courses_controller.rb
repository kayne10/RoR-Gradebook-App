class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    # binding.pry
    if @course.save
      # redirect to profile
      redirect_to current_user
    else
      # render new and handle error
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :start_date, :end_date, :user_id)
  end

end
