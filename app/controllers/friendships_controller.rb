class FriendshipsController < ApplicationController
  def index
    @subscribers = Friendship.where(user: params[:user_id])
  end

  def subscriptions
    @subscriptions = current_user.subscriptions
  end

  def subscribers
    @subscribers = current_user.subscribers
  end

  def create
    result = FriendshipService::FriendshipCreate.new.call(params[:user], current_user)
    flash_service_result result
    redirect_to request.referer
  end

  def destroy
    result = FriendshipService::FriendshipDestroy.new.call(params[:id], current_user)
    flash_service_result result
    redirect_to request.referer
  end
end
