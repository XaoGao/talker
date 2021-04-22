module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def avatar(user)
    # if user.main_photo.present?
    #   image_tag(user.main_photo.image, alt: user.username, class: 'avatar')
    # else
      image_tag('user', alt: user.username, class: 'avatar')
    # end
  end
end
