class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = current_user.bookmarks_posts
                             .includes(:author, :bookmarks, picture: { image_attachment: :blob })
                             .paginate(page: params[:page], per_page: 5)
                             .recently
                             .decorate

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    bookmark = current_user.bookmarks.new bookmark_params
    if bookmark.save
      respond_to do |format|
        format.js do
          @bookmark = bookmark
          render '/bookmarks/create'
        end
      end
    else
      flash[:alert] = t('bookmarks.create.error')
      render :index
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    respond_to do |format|
      format.js do
        @bookmark = bookmark
        render '/bookmarks/destroy'
      end
    end
  end

  private

  def bookmark_params
    params.permit(:bookmarkable_id, :bookmarkable_type)
  end
end
