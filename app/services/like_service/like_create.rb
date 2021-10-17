module LikeService
  class LikeCreate < Service
    include Callable
    def call(**options)
      likeable = Object.const_get(options[:likeable_type]).find_by(id: options[:likeable_id])
      return error I18n.t('likes.create.error') if likeable.blank?

      like = Like.find_by(user: options[:user], likeable_type: options[:likeable_type], likeable_id: options[:likeable_id])
      if like.present?
        liked = false
        like.destroy
      else
        like = Like.create(user: options[:user], likeable_type: options[:likeable_type], likeable_id: options[:likeable_id])
        liked = true
      end
      success({ liked: liked, like: like })
    end
  end
end
