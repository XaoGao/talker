class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification
                     .includes([:actor])
                     .where(recipient: current_user)
                     .paginate(page: params[:page], per_page: 15)
                     .recently
                     .decorate

    respond_to do |format|
      format.html
      format.js
    end
  end

  def unread
    @notifications = Notification.unread(current_user).recently
    respond_to do |format|
      format.js do
        render '/notifications/unread'
      end
    end
  end

  def recently
    @notifications = Notification.where(recipient: current_user).limit(3).includes([:actor]).recently
    respond_to do |format|
      format.js do
        render '/notifications/recently'
      end
    end
  end

  def read
    @notifications = Notification.where(recipient: current_user, read_at: nil)
    redirect_to notifications_path
  end
end
