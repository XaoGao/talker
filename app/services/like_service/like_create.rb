module LikeService
  class LikeCreate < Service
    include Callable
    def call(user:, likeable_type:, likeable_id:)
      like = Like.find_by(user: user, likeable_type: likeable_type, likeable_id: likeable_id)
      if like.present?
        liked = false
        like.destroy
      else
        Like.create(user: user, likeable_type: likeable_type, likeable_id: likeable_id)
        liked = true
      end
      success({ liked: liked, like: like })
    end
  end
end
