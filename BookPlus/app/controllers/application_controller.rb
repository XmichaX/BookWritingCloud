class ApplicationController < ActionController::Base

	protect_from_forgery
	I18n.locale = :de
	before_filter :set_counter_cookie, :configure_permitted_parameters, if: :devise_controller?

	# set page to redirect after login
	def after_sign_in_path_for(resource)
		books_path
	end

	def render_check_template(action=params[:action])
		render action, layout: params[:render_template] != 'false'
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation) }
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :first_name, :last_name, :username, :email, :password, :remember_me) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password) }
	end

	private # all public methods are actions
	def find_book
		@book = Book.find(params[:book_id])
	end

	private
	def find_all_users
		@users = User.all
	end

#cookies
	private # all public methods are actions
	def set_counter_cookie
		count = cookies[:counter]
		cookies[:counter] = (count.nil?) ? 1 : count.to_i + 1
		cookies[:months] = {
				value: 8,
				expires: 2.months.from_now,
				path: 'books',
				domain: '0.0.0.0'}
	end


	#session Management mit cookies
	private
	def get_user_from_session
		@user = User.find(session[:user_id])
	end
end



