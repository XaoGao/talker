class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.new
  end

  def create
    @article = Article.new(author: current_user, body: params[:article][:body])
    if @article.save
      if params[:article][:picture].present?
        @picture = Picture.create(
          image: params[:article][:picture],
          title: params[:article][:picture].original_filename,
          is_main: true)
        @article.pictures << @picture
      end
      flash[:notice] = 'Новость опубликована'
    else
      flash[:alert] = 'Ошибка при публикации новости'
    end
    redirect_to request.referer
  end
end
