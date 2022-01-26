module ArticlesHelper
  def avatar_article_creater(user)
    if user.main_photo.present?
      image_tag(user.main_photo.image, alt: user.username, class: 'rounded-circle', height: '40', width: '40')
    else
      image_tag('user', alt: user.username, class: 'rounded-circle', height: '40', width: '40')
    end
  end

  def image_for(article)
    if article.image?
      image_tag url_for(article.image), alt: article.image_title, size: "286x180", class: "card-img-top"
    end
  end
end
