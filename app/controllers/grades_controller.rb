class GradesController < ApplicationController
  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def show
    @grade = Grade.find(params[:id])
  end

  def create
    @grade = Grade.new(grade_params)
    # binding.pry
    if @grade.save
      # flash success
      render 'index'
    else
      # handle error
      render 'new'
    end
  end

  def update
  end

  private

  def grade_params
    params.require(:grade).permit(:grade_value, :user_id, :course_id)
  end
end
