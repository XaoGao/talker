# == Schema Information
#
# Table name: articles
#
#  id             :bigint           not null, primary key
#  body           :text             default(""), not null
#  comments_count :integer          default(0), not null
#  likes_count    :integer          default(0), not null
#  lock           :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint           not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
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

  describe '#image?' do
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
  end
  describe '#image_title' do
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
  end

  describe '#image' do
    let(:picture) { create(:picture) }
    let(:article) { create(:article, picture: picture) }

    it 'return a picture of an article' do
      expect(article.image).to eq(picture.image)
    end
  end

  describe '#type_with_id' do
    let(:article) { create(:article) }
    it 'return type dush id' do
      expect(article.type_with_id).to eq('Article-1')
    end
  end

  describe '#alredy_bookmark?' do
    let(:author) { create(:user) }
    let(:another_user) { create(:user) }
    let(:article) { create(:article, author: author) }
    let!(:bookmark) { create(:bookmark, user: author, bookmarkable: article) }
    it 'should return true' do
      expect(article.alredy_bookmark?(author)).to be true
    end

    it 'should return false' do
      expect(article.alredy_bookmark?(another_user)).to be false
    end
  end
end
