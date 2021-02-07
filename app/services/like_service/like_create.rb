module LikeService
  class LikeCreate < Service
    def call(user, type, id)
      like = Like.find_by(user: user, likeable_type: type, likeable_id: id)
      if like.present?
        liked = false
        like.destroy
      else
        Like.create(user: user, likeable_type: type, likeable_id: id)
        liked = true
      end
      success({ liked: liked, like: like })
    end
  end
end
