class SectionsController < ApplicationController

  before_filter :set_page_title

  def index
    @sections = Section.all
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    @section = Section.new
  end
  
  def create
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "Congratulations, #{@section.name} has been added as a section."
      redirect_to @section
    else
      render :new
    end
  end
  
  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      flash[:notice] = "The section, #{@section.name}, has been succesffully updated."
      redirect_to @section
    else
      render :edit
    end
  end
  
  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "The section, #{@section.name}, was successfully deleted."
    redirect_to sections_path
  end   

  def set_page_title
    @page_title = "Sections"
  end

end
