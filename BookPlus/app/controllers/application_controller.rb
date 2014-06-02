class ApplicationController < ActionController::Base
  protect_from_forgery

  # set page to redirect after login
  def after_sign_in_path_for(resource)
    books_path
  end

  def render_check_template(action=params[:action])
    render action, layout: params[:render_template] != 'false'
  end


  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name
  end
end



