module FriendshipService
  class FriendshipCreate < Service
    include Callable
    def call(user_id:, subscriber:)
      user = User.friendly.find(user_id)
      Friendship.create(user: user, subscriber: subscriber)
      success "Вы подписались на #{user.username}"
    end
  end
end
