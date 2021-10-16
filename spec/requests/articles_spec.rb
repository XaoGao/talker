require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /index' do
    context 'with sign in user' do
      let(:user) { create(:user) }
      before(:each) do
        sign_in user
      end

      it 'should be a success response' do
        get articles_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'without sign in user' do
      it 'should be redirect to root path' do
        get articles_path
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /create' do
    let(:article) { build(:article) }
    context 'with sing in user' do
      let(:user) { build(:user) }
      let(:user_lock) { (build(:user, lock: true)) }

      it 'should be a error response user have not policy' do
        sign_in user_lock
        post articles_path,
             params: { article: article.attributes },
             headers: { 'HTTP_REFERER' => root_path }

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match(I18n.t('articles.create.policy.error'))
      end

      it 'should be a success response' do
        sign_in user
        post articles_path, params: { article: article.attributes }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(articles_path)
        expect(flash[:notice]).to match(I18n.t('articles.create.success'))
      end
    end

    context 'without sing in user' do
      it 'should be redirect to root path ' do
        post articles_path, params: article.attributes
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
