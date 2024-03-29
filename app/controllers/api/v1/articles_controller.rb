class Api::V1::ArticlesController < Api::BaseController
  before_action :token_authenticate_user!

  def index
    @articles = Article.search("*#{params[:query]}*")
    render json: { result: @articles }, status: :ok
  end
end
