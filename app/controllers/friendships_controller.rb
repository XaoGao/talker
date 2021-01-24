class FriendshipsController < ApplicationController
  def index
    @subscribers = Friendship.where(user: params[:user_id])
  end

  def subscriptions
    subscriptions = Friendship.where(subscriber: params[:user_id])
    @subscriptions = []
    subscriptions.each do |subscription|
      @subscriptions.push(User.find(subscription.user_id))
    end
  end

  def subscribers
    @subscribers = current_user.subscribers
  end
  
  def create; end
  
  def delete; end
end
