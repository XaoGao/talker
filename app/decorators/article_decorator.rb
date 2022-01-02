class ArticleDecorator < ApplicationDecorator
  delegate_all

  def created_time
    created_at.strftime('%Y %m %H:%M')
  end
end
