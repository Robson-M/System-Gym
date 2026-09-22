class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:cpf, :name_user, :phone_user, :birth_date_user])
    devise_parameter_sanitizer.permit(:account_update, keys: [:cpf, :name_user, :phone_user, :birth_date_user])
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
