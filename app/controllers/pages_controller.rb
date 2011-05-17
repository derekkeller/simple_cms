class PagesController < ApplicationController

  before_filter :set_page_title

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new
    @page_count = Page.count + 1
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Congratulations, #{@page.name}, has been added as a new page."
      redirect_to @page
    else
      @page_count = Page.count + 1
      render :new
    end
  end
  
  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "The page, #{@page.name}, has been succesfully updated."
      redirect_to @page
    else
      @page_count = Page.count
      render :edit
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "The page, #{@page.name}, was successfully deleted."
    redirect_to pages_path
  end      

  private
    def set_page_title
      @page_title = "Pages"
    end

end
