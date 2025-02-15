class Users::RegistrationsController < Devise::RegistrationsController
  # Permitir o parâmetro funcao_id no registro
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:funcao_id])
  end
end
