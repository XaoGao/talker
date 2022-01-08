class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @message = Message.new message_params
    @message.sender = current_user
    if @message.save
      ActionCable.server.broadcast "room_channel_#{@message.dialog_id}", content: render_message(@message.decorate)
    end
  end

  def update
    @message = Message.find(params[:id])
    flash[:alert] = t('messages.error') unless @message.update message_params

    redirect_to request.referer
  end

  def destroy
    @message = Message.find(params[:id])
    flash[:alert] = t('messages.error') unless @message.update(lock: true)

    redirect_to request.referer
  end

  private

  def message_params
    params.require(:message).permit(:body, :dialog_id)
  end

  def render_message(message)
    ApplicationController.render(partial: 'messages/message', locals: { message: message })
  end
end
