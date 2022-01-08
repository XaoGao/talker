# == Schema Information
#
# Table name: bookmarks
#
#  id                :bigint           not null, primary key
#  bookmarkable_type :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  bookmarkable_id   :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_bookmarks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :bookmarkable, polymorphic: true

  def bookmarkable_type_with_id
    "#{bookmarkable_type}-#{bookmarkable_id}"
  end
end
