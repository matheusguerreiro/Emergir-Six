class ApplicationController < ActionController::Base
  layout :layout_by_resource


  protected

  def layout_by_resource
    devise_controller? ? "#{resource_class.to_s.downcase}s_devise" : "application"
  end
end
