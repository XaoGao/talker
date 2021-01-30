class DialogsController < ApplicationController
  def index
    @dialogs = current_user.dialogs
  end

  def show
    @dialog = Dialog.find(params[:id])
    @message = Message.new
  end
end
