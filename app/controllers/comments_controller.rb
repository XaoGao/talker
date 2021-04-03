class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    comments = Comment.includes([:user]).where(commentable_id: params[:id], commentable_type: params[:type])
    respond_to do |format|
      format.js do
        @type = params[:type]
        @id = params[:id]
        @comments = comments
        render '/comments/index'
      end
    end
  end

  def create
    @comment = Comment.new comment_params
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.js do
          render '/comments/create'
        end
      end
    else
      redirect_to request.referer, alert: 'Непредвиденная ошибка в ходе добавления комментария, обратитесь к администратору'
    end
  end

  def show
    comment = Comment.find(params[:id])
    if comment.present?
      respond_to do |format|
        format.js do
          @comment = comment
          render '/comments/show'
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
