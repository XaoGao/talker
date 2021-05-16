class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    result = LikeService::LikeCreate.call(user: current_user, likeable_type: params[:type], likeable_id: params[:id])
    respond_to do |format|
      format.js do
        @liked = result.data[:liked]
        @id = params[:id]
        @type = params[:type]
        render 'likes/create'
      end
    end
  end
end
