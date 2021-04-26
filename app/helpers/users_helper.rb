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
end
