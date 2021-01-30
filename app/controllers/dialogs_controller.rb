class DialogsController < ApplicationController
  def index
    @dialogs = current_user.dialogs
  end
end
