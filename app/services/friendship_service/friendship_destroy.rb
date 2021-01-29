module FriendshipService
  class FriendshipDestroy < Service
    def call(user_id, subscriber)
      user = User.find(user_id)
      if user.blank?
        error 'Не найден пользователь'
      else
        friendship = Friendship.find_by(user: user, subscriber: subscriber)
        destroy friendship, user.username
      end
    end

    private

    def destroy(friendship, username)
      if friendship.present?
        friendship.destroy
        success "Вы отписались от #{username}"
      else
        error "Вы не подписаны на #{username}"
      end
    end
  end
end
