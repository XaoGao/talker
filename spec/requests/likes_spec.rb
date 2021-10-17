require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'GET /index' do
    context 'when user is not sign in' do
      it 'should redirect ot user sign in path' do
        get likes_path
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is sign in' do
      let(:current_user) { create(:user) }
      before(:each) do
        sign_in current_user
      end

      it 'should return a success response' do
        get likes_path
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST /create' do
    context 'when user is not sign in' do
      it 'should redirect ot user sign in path' do
        post likes_path
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is sign in' do
      let(:current_user) { create(:user) }
      let(:article) { create(:article) }
      before(:each) do
        sign_in current_user
      end

      it 'should return a error response' do
        post likes_path,
             xhr: true,
             params: { id: 0, type: article.class },
             headers: { 'HTTP_REFERER' => root_path }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(I18n.t('likes.create.error'))
      end

      it 'should return a success response' do
        post likes_path,
             xhr: true,
             params: { id: article.id, type: article.class },
             headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
