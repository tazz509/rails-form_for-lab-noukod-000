class SchoolClassesController < ApplicationController

  def new
    @school_class = SchoolClass.new
  end

  def show
    set_schoolclass
  end

  def create
    @school_class = SchoolClass.create school_class_params(:title, :room_number)
		redirect_to school_class_path(@school_class)
  end

  def edit
    set_schoolclass
  end

  def update
    set_schoolclass
    @school_class.update school_class_params(:title)
    redirect_to school_class_path
  end

  private
  def set_schoolclass
    @school_class = SchoolClass.find(params[:id])
  end

  def school_class_params(*args)
    params.require(:school_class).permit(*args)
  end

end
