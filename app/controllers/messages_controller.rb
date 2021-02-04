class MessagesController < ApplicationController
  def create
    @message = Message.new message_params
    @message.sender = current_user
    if @message.save
      ActionCable.server.broadcast "room_channel_#{@message.dialog_id}", content: render_message(@message)
    end
  end

  def update
    @message = Message.find(params[:id])
    flash[:alert] = 'Ошибка во время отправки сообщения' unless @message.update message_params

    redirect_to request.referer
  end

  def destroy
    @message = Message.find(params[:id])
    flash[:alert] = 'Ошибка во время отправки сообщения' unless @message.update(lock: true)

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
