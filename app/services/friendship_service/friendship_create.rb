module FriendshipService
  class FriendshipCreate < Service
    def call(user_id, subscriber)
      user = User.friendly.find(user_id)
      if user.blank?
        error 'Ошибка во время подписки'
      else
        Friendship.create(user: user, subscriber: subscriber)
        success "Вы подписались на #{user.username}"
      end
    end
  end
end
