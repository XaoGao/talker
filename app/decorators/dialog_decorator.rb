class DialogDecorator < ApplicationDecorator
  delegate_all

  def create_time_of_last_message
    if messages.last.present?
      messages.last.created_at.strftime('%d/%m/%Y')
    else
      ''
    end
  end
end
