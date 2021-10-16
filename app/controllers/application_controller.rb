class ApplicationController < ActionController::Base
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

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.locale
    else
      I18n.locale = I18n.default_locale
    end
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end
end
