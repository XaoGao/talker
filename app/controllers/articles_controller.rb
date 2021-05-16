class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.with_author.with_picture
                       .paginate(page: params[:page], per_page: 5)
                       .recently
    @article = Article.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @article = Article.new(author: current_user, body: params[:article][:body])
    create_picture if params[:article][:picture].present?

    if @article.save
      flash[:notice] = 'Новость опубликована'
    else
      flash[:alert] = 'Ошибка при публикации новости'
    end
    redirect_to request.referer
  end

  private

  # TODO: убрать picture
  def create_picture
    picture = Picture.create(
      image: params[:article][:picture],
      title: params[:article][:picture].original_filename,
      is_main: true
    )
    @article.pictures << picture
  end
end
