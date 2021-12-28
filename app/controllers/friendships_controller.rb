class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscribers = Friendship.where(user: params[:user])
  end

  def subscriptions
    @subscriptions = current_user.subscriptions
  end

  def subscribers
    @subscribers = current_user.subscribers
  end

  def create
    result = FriendshipService::FriendshipCreate.call(user_id: params[:user], subscriber: current_user)
    flash_service_result result
    redirect_to request.referer
  end

  def destroy
    result = FriendshipService::FriendshipDestroy.call(user_id: params[:id], subscriber: current_user)
    flash_service_result result
    redirect_to request.referer
  end
end
