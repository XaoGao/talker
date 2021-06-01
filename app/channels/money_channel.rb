class MoneyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "money_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
