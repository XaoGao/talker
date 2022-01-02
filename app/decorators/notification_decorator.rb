class NotificationDecorator < ApplicationDecorator
  delegate_all

  def created_time
    created_at.strftime('%F')
  end
end
