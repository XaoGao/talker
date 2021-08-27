module FriendshipService
  class FriendshipCreate < Service
    include Callable
    def call(user_id:, subscriber:)
      user = User.friendly.find_by(slug: user_id)
      if user.blank?
        error 'Ошибка во время подписки'
      else
        Friendship.create(user: user, subscriber: subscriber)
        success "Вы подписались на #{user.username}"
      end
    end
  end
end
