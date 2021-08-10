class MoneyChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'money_channel'
  end
end
