class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])

    if @course.save
      flash[:notice] = "Course has been created."
      redirect_to '/'
    else
      flash[:alert] = "Course has not been created."
      render :action => "new"
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      flash[:notice] = "Course has been updated."
      redirect_to course_assignments_path
    else
      flash[:alert] = "Course has not been updated"
      render :action => 'edit'
    end
  end

  def show
    @course = Course.find(params[:id])
  end
end
