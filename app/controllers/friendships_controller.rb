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

  def create
    user = User.find(params[:user])
    if user.blank?
      flash[:alert] = 'Ошибка во время подписки'
    else
      Friendship.create(user: user, subscriber: current_user)
      flash[:notice] = "Вы подписались на #{user.username}"
    end
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:id])
    if user.blank?
      flash[:alert] = 'Не найден пользователь'
    else
      friendship = Friendship.find_by(user: user, subscriber: current_user)
      if friendship.present?
        friendship.destroy
        flash[:notice] = "Вы отписались от #{user.username}"
      end
    end
    redirect_to request.referer
  end
end
