module UsersHelper
  def online_label(user)
    if user.online
      'online'
    else
      if user.last_sign_in_at.nil?
        'offline'
      else
        time_ago_in_words(user.last_sign_in_at)
      end
    end
  end

  def main_avatar(user)
    if user.main_photo.present?
      image_tag(@user.main_photo.image, alt: @user.username, class: 'card-img-top')
    else
      image_tag('user', alt: 'Card image cap', class: 'card-img-top')
    end
  end
end
