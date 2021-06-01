class MoneyWorker
  include Sidekiq::Worker

  def perform(*args)
    result = MoneyService::CreateExchangeRate.call
    if result.success?
      ActionCable.server.broadcast 'money_channel', content: result.data
    end
  end
end
