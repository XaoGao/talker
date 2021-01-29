class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :date_of_birth])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :first_name, :last_name, :date_of_birth])
  end

  def flash_service_result(result)
    if result.success?
      flash[:notice] = result.data
    else
      flash[:alert] = result.error
    end
  end
end
