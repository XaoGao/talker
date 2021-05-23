class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article
                .with_author
                .includes([picture: { image_attachment: :blob }])
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

  def create_picture
    @article.pictures << Picture.create(
      image: params[:article][:picture],
      title: params[:article][:picture].original_filename,
      is_main: true
    )
  end
end
