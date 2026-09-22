class Users::RegistrationsController < Devise::RegistrationsController

  def require_no_authentication
  end

  protected

  def after_sign_up_path_for(resource)
    users_path
  end

  def sign_up(resource_name, resource)
  end

  def after_update_path_for(resource)
    users_path
  end

  def after_destroy_user_session_path(resource)
    users_path
  end
end