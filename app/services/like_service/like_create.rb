module LikeService
  class LikeCreate < Service
    include Callable
    def call(**options)
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
