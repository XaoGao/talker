class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).recently
  end

  def unread
    @notifications = Notification.where(recipient: current_user).unread.recently
    respond_to do |format|
      format.js do
        render '/notifications/unread'
      end
    end
  end

  def recently
    @notifications = Notification.where(recipient: current_user).limit(3).recently
    respond_to do |format|
      format.js do
        render '/notifications/recently'
      end
    end
  end
end
