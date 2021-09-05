class MoneyWorker
  include Sidekiq::Worker

  def perform(*_args)
    result = MoneyService::CreateExchangeRate.call
    ActionCable.server.broadcast 'money_channel', content: result.data if result.success?
  rescue StandardError => e
    Rails.logger.error e.message
    Rails.logger.error e.backtrace.join("\n")
  end
end
