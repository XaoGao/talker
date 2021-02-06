class LikesController < ApplicationController
  def create
    like = Like.find_by(user: current_user, likeable_type: params[:type], likeable_id: params[:id])
    if like.present?
      liked = false
      like.destroy
    else
      Like.create(user: current_user, likeable_type: params[:type], likeable_id: params[:id])
      liked = true
    end
    respond_to do |format|
      format.js do
        @liked = liked
        @id = params[:id]
        @type = params[:type]
        render 'likes/create'
      end
    end
  end
end
