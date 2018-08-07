class EnrollmentsController < ApplicationController
  def new
    @enrollment = Enrollment.new
    @courses = Course.where(user_id:current_user.id)
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      #flash success
      redirect_to current_user
    else
      # handle error
      render 'new'
    end
  end

  def delete

  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :user_id, :semester_id)
  end
end
