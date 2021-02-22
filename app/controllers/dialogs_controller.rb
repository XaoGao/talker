class DialogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @dialogs = current_user.dialogs
  end

  def show
    @dialog = Dialog.find(params[:id])
    @messages = @dialog.messages
    @message = Message.new
  end

  def create
    user = User.find(params[:user])
    if user.present?
      dialog = Dialog.get_or_create(current_user, user)
      redirect_to dialog_path dialog
    else
      flash[:alert] = 'Ошибка при переходе к диалогу'
    end
  end
end
