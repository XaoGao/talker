class LikedObjectQueries
  def self.call(user)
    likes_articles = user.likes_articles.with_author.with_picture.decorate
    likes_comments = user.likes_comments.with_user
    likes_pictures = user.likes_pictures

    likes_articles + likes_comments + likes_pictures
  end
end
