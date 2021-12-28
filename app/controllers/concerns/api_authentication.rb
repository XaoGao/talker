
# frozen_string_literal: true

module ApiAuthentication
  extend ActiveSupport::Concern

  included do
    def token_authenticate_user!
      render json: { error: 'Пользователь должен авторизоваться' }, status: :unauthorized unless logged_in?
    end

    private

    def authorization_header
      request.headers['Authorization']
    end

    def token
      authorization_header.split(' ').compact.last
    end

    def decoded
      JwtService.decode(token)[0]
    rescue StandardError => e
      nil
    end

    def user_from_token
      return unless decoded

      return if token_expired?(decoded['exp'])

      user_id = decoded['id']
      @current_user = User.find(user_id)
    end

    def logged_in?
      !!user_from_token
    end

    def token_expired?(exp)
      DateTime.now.to_i > exp
    end
  end
end
