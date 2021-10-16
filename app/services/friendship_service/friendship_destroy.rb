module FriendshipService
  class FriendshipDestroy < Service
    include Callable
    def call(user_id:, subscriber:)
      user = User.friendly.find(user_id)
      if user.blank?
        error I18n.t('friendships.destroy.user_error')
      else
        friendship = Friendship.find_by(user: user, subscriber: subscriber)
        destroy friendship, user.username
      end
    end

    private

    def destroy(friendship, username)
      if friendship.present?
        friendship.destroy
        success "#{I18n.t('friendships.destroy.success')} #{username}"
      else
        error "#{I18n.t('friendships.destroy.error')}  #{username}"
      end
    end
  end
end
