class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article
                .includes([:author])
                .includes([:bookmarks])
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
    unless ArticlePolicy::ArticleCreatePolicy.create?(current_user)
      flash[:alert] = t('articles.create.policy.error')
      redirect_to request.referer and return
    end
    @article = Article.new(author: current_user, body: params[:article][:body])
    create_picture if params[:article][:picture].present?

    if @article.save
      flash[:notice] = t('articles.create.success')
    else
      flash[:alert] = t('articles.create.error')
    end
    redirect_to articles_path
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
