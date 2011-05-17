class SubjectsController < ApplicationController

  before_filter :set_page_title

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      flash[:notice] = "Congratulations, #{@subject.name.capitalize} has been added as a new subject!"
      redirect_to @subject
    else
      render :new
    end
  end
     
  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "The subject, #{@subject.name}, has been successfully updated."
      redirect_to @subject
    else
      render :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "The subject, #{@subject.name}, was successfully deleted."
    redirect_to subjects_path
  end
  
  def set_page_title
    @page_title = "Subjects"
  end

end