# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  body           :text             default(""), not null
#  comments_count :integer          default(0), not null
#  likes_count    :integer          default(0), not null
#  lock           :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :integer          not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => users.id)
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'scopes' do
    context '.user_liked?' do
      let(:user) { create(:user) }
      let(:article) { create(:article) }
      it 'user liked a article' do
        article.likes.create(user: user)
        expect(article.user_liked?(user)).to be true
      end
      it "user didn't like a article" do
        expect(article.user_liked?(user)).to be false
      end
    end
  end

  describe 'methods' do
    context '#image?' do
      let(:picture) { create(:picture) }
      let(:article) { create(:article, picture: picture) }
      it 'have image' do
        expect(article.image?).to be true
      end

      it "haven't a main image" do
        article.picture.is_main = false
        article.save
        expect(article.image?).to be false
      end

      it 'havent image' do
        # TODO!
        # article.picture = nil
        # picture.delete
        # article.picture.delete
        # article.save
        # expect(article.picture).to eq(nil)
        # expect(article.image?).to be false
      end
    end
    context '#image_title' do
      let(:picture) { create(:picture) }
      let(:article) { create(:article, picture: picture) }
      it 'have image' do
        expect(article.image_title).to eq(picture.title)
      end

      it "haven't a main image" do
        article.picture.is_main = false
        article.save
        expect(article.image_title).to eq(picture.title)
      end

      it 'havent image' do
        # TODO
        # article.picture.is_main = false
        # article.save
        # expect(article.image_title).to eq(picture.title)
      end
    end

    context '#created_time' do
      let(:article) { create(:article, created_at: '2021-01-23 21:10:44.693086') }

      it 'get date time' do
        expect(article.created_time).to eq('2021 01 21:10')
      end
    end
  end
end
