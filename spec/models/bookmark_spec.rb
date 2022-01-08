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
require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'methods' do
    context '#bookmarkable_type_with_id' do
      let(:bookmark) { create(:bookmark) }
      it 'return type with id' do
        expect(bookmark.bookmarkable_type_with_id).to eq("Article-#{bookmark.bookmarkable_id}")
      end
    end
  end
end
