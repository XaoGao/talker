class ArticleDecorator < ApplicationDecorator
  delegate_all

  def created_time
    created_at.strftime('%Y %m %H:%M')
  end

  def type
    'Article'
  end

  def type_with_id
    "Article-#{id}"
  end
end
