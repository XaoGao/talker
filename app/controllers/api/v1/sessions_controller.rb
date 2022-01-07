class Api::V1::SessionsController < Api::BaseController
  def create
    if params[:email].nil? || params[:password].nil?
      render json: { error: 'Не указана почта или пароль' }, status: :bad_request and return
    end
    result = SessionService::CreateSessionService.call email: params[:email], password: params[:password]
    render_result result
  end

  private

  def render_result(result)
    if result.success?
      render json: { token: result.data }, status: :ok
    else
      render json: { error: result.error }, status: :bad_request
    end
  end
end
