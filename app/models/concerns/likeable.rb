module Likeable
  extend ActiveSupport::Concern

  def user_liked?(user)
    likes.where(user: user).any?
  end
end
