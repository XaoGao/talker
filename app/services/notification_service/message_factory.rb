module NotificationService
  class MessageFactory
    attr_reader :notification

    def initialize(notification)
      @notification = notification
    end

    def generate_message
      message = ''
      actions.each do |type|
        if notification.action == type
          message = "#{notification.actor.first_name} " + I18n.t("notifications.#{type}")
          break
        end
      end

      message
    end

    private

    def actions
      %w[liked commended]
    end
  end
end
