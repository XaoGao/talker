class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes_posts = current_user.likes_posts
  end

  def create
    result = LikeService::LikeCreate.call(user: current_user, likeable_type: params[:type], likeable_id: params[:id])
    if result.success?
      respond_to do |format|
        format.js do
          @liked = result.data[:liked]
          @like = result.data[:like]
          render 'likes/create'
        end
      end
    else
      flash[:alert] = result.error
      redirect_to root_path
    end
  end
end
