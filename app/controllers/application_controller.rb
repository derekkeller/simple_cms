class ApplicationController < ActionController::Base
  protect_from_forgery

  def text_area_size
    @text_area_size = "40x40"
  end

end
