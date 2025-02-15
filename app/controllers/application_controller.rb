class ApplicationController < ActionController::Base
  # before_action :authenticate_user! # Autentica o usuário antes de qualquer ação
  include Pagy::Backend # Inclui Pagy para uso no Backend

  # Definir o layout de acordo com o controller
  # before_action :set_layout_by_controller

  before_action :set_layout_by_controller

  private

  def set_layout_by_controller
    self.class.layout controller_name == "landing" ? "home_application" : "application"
  end
  # private
  #
  # def set_layout_by_controller
  #   if devise_controller?
  #     self.class.layout "devise_application"
  #   elsif controller_name == "home"
  #     self.class.layout "home_application"
  #   else
  #     self.class.layout "application"
  #   end
  # end
end
