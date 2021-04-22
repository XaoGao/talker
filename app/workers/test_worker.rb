class TestWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(name, sec)
    p "Hi #{name}"
  end
end
