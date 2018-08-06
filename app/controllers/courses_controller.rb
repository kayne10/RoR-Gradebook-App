class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @teachers = User.where(teacher:true)
  end

  def show
    @course = Course.find(params[:id])
    # find users that are students and registed with class
    # @students = User.where(student:true)
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    #binding.pry
    if @course.save
      # redirect to profile
      redirect_to current_user
    else
      # render new and handle error
      render 'new'
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      # fash success and redirect
      redirect_to current_user
    else
      # handle error message
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    # flash success and redirect
    redirect_to current_user
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :start_date, :end_date, :user_id)
  end

end
