module Bookmarkable
  extend ActiveSupport::Concern

  def alredy_bookmark?(user)
    bookmarks.any? { |bookmark| bookmark.user == user }
  end
end
