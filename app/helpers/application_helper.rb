module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def avatar(user)
    if user.main_photo.present?
      image_tag(user.main_photo.image, alt: user.username, class: 'avatar')
    else
      image_tag('user', alt: user.username, class: 'avatar')
    end
  end

  def current_rate
    rate ||= ExchangeRate.last_rate
  end

  def current_rate_usd
    current_rate.blank? ? 'Нет данных' : "USD: #{current_rate.USD}"
  end

  def current_rate_title
    current_rate.blank? ? 'Нет данных' : "Данные на #{current_rate.created_at.strftime('%Y %m %H:%M')}"
  end
end
