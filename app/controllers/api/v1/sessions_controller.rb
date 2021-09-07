class Api::V1::SessionsController < Api::BaseController
  def create
    if params[:email].nil? || params[:password].nil?
      render json: { error: 'Не указана почта или пароль' }, status: :bad_request and return
    end

    user = User.find_by(email: params[:email])

    if user.blank? || !user.valid_password?(params[:password])
      render json: { error: 'Некорректо указана почта или пароль' }, status: :bad_request and return
    end

    token = JwtService.encode email: user.email, id: user.id
    render json: { token: token }, status: :ok
  end
end
