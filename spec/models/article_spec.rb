require 'rails_helper'

RSpec.describe Article, type: :model do
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
