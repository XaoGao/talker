class MessageDecorator < ApplicationDecorator
  delegate_all

  def created_time
    created_at.strftime("%H:%M")
  end
end
