class Comment < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :commentable, counter_cache: true, polymorphic: true
end
