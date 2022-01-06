module NotificationService
  class MessageFactory
    attr_reader :notification

    def initialize(notification)
      @notification = notification
    end

    def generate_message
      action = actions.find { |type| notification.action == type }
      I18n.t "notifications.#{action}", username: notification.actor.first_name
    end

    private

    def actions
      %w[liked commended]
    end
  end
end
