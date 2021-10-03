# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text             default(""), not null
#  commentable_type :string
#  likes_count      :integer          default(0), not null
#  lock             :boolean          default(FALSE), not null
#  spam             :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  user_id          :integer          not null
#
# Indexes
#
#  index_comments_on_commentable_type_and_commentable_id  (commentable_type,commentable_id)
#  index_comments_on_user_id                              (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    context 'require fields' do
      it { should validate_presence_of(:body) }
    end
    context 'length' do
      it { should validate_length_of(:body).is_at_most(1000) }
    end
  end

  describe 'methods' do
    context '#type_with_id' do
      let(:comment) { create(:comment) }
      it 'should return a string class name with id' do
        expect(comment.type_with_id).to eq('Comment-1')
      end
    end
  end
end
