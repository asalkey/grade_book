class AssignmentsController < ApplicationController
  before_filter :find_courses
  before_filter :find_assignment, :only => [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @assignment = @course.assignments.build
  end

  def create
    @assignment = @course.assignments.build(params[:assignment])

    if @assignment.save
      flash[:notice] = "Your assignment has been saved"
      redirect_to @course
    else
      flash[:alert] = "Your assignment has not been saved"
      render :action => 'new'
    end
  end

  def edit
  end

  def update
     if @assignment.update_attributes(params[:assignment])
      flash[:notice] = "Assignment has been updated."
      redirect_to @course
    else
      flash[:alert] = "Assignment has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @assignment.destroy
    flash[:notice] = "Assignment has been deleted."
    redirect_to @course
  end

  private
    def find_courses
      @course = Course.find(params[:course_id])
    end

    def find_assignment
      @assignment = @course.assignments.find(params[:id])
    end
end
