class DialogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dialogs = current_user.dialogs.decorate
  end

  def show
    @dialog = Dialog.find(params[:id])
    @messages = @dialog.messages_for_user(current_user, params[:page]).decorate
    @message = Message.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.friendly.find(params[:user])
    dialog = DialogService::DialogGetOrCreate.call(owner_member: current_user, second_member: user)
    redirect_to dialog_path dialog
  end
end
