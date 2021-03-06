class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user.teacher?
      @user = User.find(params[:id])
      # filter through courses managed by teacher
      @courses = Course.where(user_id:current_user.id)
      # filter through users who are students
      @students = User.where(student:true)
      # inner join to get teacher's students
      @teachers_students = User.joins(enrollment: [{course: :grade}]).where('courses.user_id'=>current_user).distinct
    elsif current_user.student?
      # @student = User.joins(:grade).where(grades: {user_id:current_user.id}).distinct
      @student = User.joins(grade: :course).distinct
      @student = @student.where(id:current_user)
      # Calculate GPA
      # @semesters = Semester.joins(course: :grade).where('grades.user_id'=>current_user).distinct
      @grades = Grade.where(user_id:current_user)
      @grade_sum = @grades.sum(:grade_value)
      @grade_count = @grades.count
      @gpa = @grade_sum.to_f / @grade_count
    else
      # inner join for semesters with enrollment count
      @semesters = Semester.joins(enrollment: :course).distinct
      @courses = Course.joins(:grade).distinct # Join for Courses and GPAs
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # binding.pry
    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = current_user
    if @user.update(user_params)
      # flash success
      redirect_to current_user
    else
      # hanle error
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :student, :teacher, :admin)
    end
end
