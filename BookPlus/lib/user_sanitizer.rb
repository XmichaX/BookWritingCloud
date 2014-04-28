class User::ParameterSanitizer < Devise::ParameterSanitizer
  private
  def new
  end

  def account_update
    default_params.permit(:full_name, :email, :password, :password_confirmation, :current_password)
  end

  def sign_up
    default_params.permit(:full_name, :email, :password, :password_confirmation, :current_password)
  end
end