class ApplicationController < ActionController::Base
  protect_from_forgery

  # set page to redirect after login
  def after_sign_in_path_for(resource)
    books_path
  end

  def render_check_template
    if params[:render_template] == 'false'
      render layout: false
    end
  end

end