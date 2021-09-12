class DialogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @dialogs = current_user.dialogs
  end

  def show
    @dialog = Dialog.find(params[:id])
    @messages = @dialog.messages
                       .includes([:sender])
                       .paginate(page: params[:page], per_page: 15)
                       .recently

    @messages.each { |m| m.read_message current_user }
    @message = Message.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.friendly.find_by(slug: params[:user])
    if user.present?
      dialog = Dialog.get_or_create(current_user, user)
      redirect_to dialog_path dialog
    else
      flash[:alert] = t('dialogs.create.error')
      redirect_to root_path
    end
  end
end
