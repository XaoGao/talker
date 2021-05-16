class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    comments = Comment.with_user.where(commentable_id: params[:id], commentable_type: params[:type])
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
    # TODO: comment = current_user.comments.new comment_params
    comment = Comment.new comment_params
    comment.user = current_user

    @comment = CommentProxy::CommentAntySpam.new(comment)

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
    # if comment.present?
    respond_to do |format|
      format.js do
        @comment = comment
        render '/comments/show'
      end
    end
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
