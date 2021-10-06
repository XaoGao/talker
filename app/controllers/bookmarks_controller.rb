class BookmarksController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookmarks = current_user.bookmarks_posts
                             .with_author
                             .with_picture
                             .recently
                             .paginate(page: params[:page], per_page: 5)


    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    bookmark = current_user.bookmarks.new(
      bookmarkable_type: params[:bookmarkable_type],
      bookmarkable_id: params[:bookmarkable_id]
    )
    if bookmark.save
      respond_to do |format|
        format.js do
          @bookmark = bookmark
          render '/bookmarks/create'
        end
      end
    else
      flash[:alert] = t('bookmarks.create.error')
      redirect_to request.referer
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
    params.require(:bookmark).permit(:bookmarkable_id, :bookmarkable_type)
  end
end
