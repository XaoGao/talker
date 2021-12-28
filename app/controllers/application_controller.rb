class ApplicationController < ActionController::Base
  include Localeable
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    attributes = %i[username first_name last_name date_of_birth gender country city role locale]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:sign_in, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def flash_service_result(result)
    if result.success?
      flash[:notice] = result.data
    else
      flash[:alert] = result.error
    end
  end
end
