class MoneyWorker
  include Sidekiq::Worker

  def perform(*args)
    # TODO: get cuurent money https://www.cbr.ru/scripts/XML_daily.asp
    # Do something
  end
end
