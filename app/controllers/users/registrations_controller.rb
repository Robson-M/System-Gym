class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [ :new, :create ]

  prepend_before_action -> { authenticate_user!(force: true) }, only: [ :new, :create ]

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
