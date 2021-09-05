require 'jwt'

module JwtService
  class << self
    HMAC_SECRET = Rails.application.credentials.hmac_secret_key
    ALGORITH = Rails.application.credentials.algorith

    def encode(payload, exp: DateTime.now + 1.hour)
      JWT.encode payload.merge({ exp: exp.to_time.to_i }), HMAC_SECRET, ALGORITH
    end

    def decode(token)
      JWT.decode(token, HMAC_SECRET, true, { algorithm: ALGORITH })
      rescue JWT::ExpiredSignature => e
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join('\n')
        nil
    end
  end
end
