# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  likeable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :bigint           not null
#  user_id       :integer          not null
#
# Indexes
#
#  index_likes_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'methods' do
    context '#likeable_type_with_id' do
      let(:like) { create(:like) }
      it 'should retrun a string likeable class with id'  do
        expect(like.likeable_type_with_id).to eq('Article-1')
      end
    end

    context '#recipients' do
      let(:user) { create(:user, first_name: 'Joy') }

      it 'should return a list of users from article' do
        article = build(:article, author: user)
        like = create(:like, likeable: article)
        expect(like.recipients).to eq([user])
      end

      it 'should return a list of users from comment' do
        comment = build(:comment, user: user)
        like = create(:like, likeable: comment)
        expect(like.recipients).to eq([user])
      end

      it 'should return a list of users from picture' do
        picture = build(:picture, imageable: user)
        like = create(:like, likeable: picture)
        expect(like.recipients).to eq([user])
      end
    end
  end
end
