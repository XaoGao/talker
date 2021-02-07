class LikesController < ApplicationController
  def create
    result = LikeService::LikeCreate.new.call(current_user, params[:type], params[:id])
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
