class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    p 'Hello World!'
  end
end
