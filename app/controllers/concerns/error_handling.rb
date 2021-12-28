module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    def notfound(exception)
      logger.warn exception
      flash[:alert] = t('global.not_found')
      redirect_to safe_path
    end

    def safe_path
      request.referer || root_path
    end
  end
end
