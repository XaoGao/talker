class BookmarksController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def create
    @bookmark = current_user.bookmarks.new bookmark_params
    if @bookmark.save
      flash[:notice] = t('bookmarks.create.success')
    else
      flash[:alert] = t('bookmarks.create.error')
    end
    redirect_to request.referer
  end

  def destroy; end

  private

  def bookmark_params
    params.require(:bookmark).permit(:bookmarkable_id, :bookmarkable_type)
  end
end
