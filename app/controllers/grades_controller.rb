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

  def edit
    @grade = Grade.find(params[:id])
  end

  def create
    @grade = Grade.new(grade_params)
    # binding.pry
    if @grade.save
      # flash success
      redirect_to current_user
    else
      # handle error
      render 'new'
    end
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update_attributes(grade_params)
      # flash success
      redirect_to current_user
    else
      # handle error
      render 'edit'
    end
  end

  private

  def grade_params
    params.require(:grade).permit(:grade_value, :user_id, :course_id)
  end
end
