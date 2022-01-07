module SessionService
  class CreateSessionService < Service
    include Callable
    def call(email:, password:)
      user = User.find_by(email: email)

      if user.blank? || !user.valid_password?(password)
        return error 'Некорректо указана почта или пароль'
      end

      success JwtService.encode email: user.email, id: user.id
    end
  end
end
