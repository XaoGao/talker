module Localeable
  extend ActiveSupport::Concern

  included do
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
end
