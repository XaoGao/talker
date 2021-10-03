require 'rails_helper'

RSpec.describe 'Bookmarks', type: :request do
  describe 'GET /index' do
    context 'when user not sign in' do
      it 'should redirect to sign in' do
        get bookmarks_path
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is sign in' do
      let(:current_user) { create(:user) }
      before(:each) do
        sign_in current_user
      end
      it 'should be a success response' do
        get bookmarks_path
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST /create' do
    let(:article) { create(:article) }
    let(:user) { create(:user) }
    let(:bookmark) { { bookmarkable_id: article.id, bookmarkable_type: article.class } }
    context 'when user is not sing in' do
      it 'should be redirect to sign in path' do
        post bookmarks_path, params: { bookmark: bookmark }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is sign in' do
      let(:current_user) { create(:user) }
      before(:each) do
        sign_in current_user
      end

      it 'should be success create a new bookmark' do
        post bookmarks_path,
             xhr: true,
             params: { bookmarkable_id: article.id, bookmarkable_type: article.class },
             headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:ok)
        expect(Bookmark.all.count).to eq(1)
      end

      it 'should be a error by create a new bookmark' do
        post bookmarks_path,
             params: { bookmarkable_id: 0, bookmarkable_type: article.class },
             headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(I18n.t('bookmarks.create.error'))
      end
    end
  end
  describe 'DELETE /destroy' do
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let!(:bookmark) { create(:bookmark, bookmarkable_id: article.id, bookmarkable_type: article.class, user: user) }
    context 'when user is not sign in' do
      it 'should redirect to sign in path' do
        delete bookmark_path(bookmark)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is sign in' do
      let(:current_user) { create(:user) }
      before(:each) do
        sign_in current_user
      end
      it 'should delete a bookmark with success response' do
        delete bookmark_path(bookmark.id), xhr: true, headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:ok)
        expect(Bookmark.all.count).to eq(0)
      end
    end
  end
end
