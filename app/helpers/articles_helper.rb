module ArticlesHelper
  def avatar_article_creater(user)
    if user.main_photo.present?
      image_tag(user.main_photo.image, alt: user.username, class: 'rounded-circle', height: '40', width: '40')
    else
      image_tag('user', alt: user.username, class: 'rounded-circle', height: '40', width: '40')
    end
  end
end
