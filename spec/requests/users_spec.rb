require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    context 'with sign in user' do
      before(:each) do
        sign_in create(:user)
      end

      it 'should be a success response' do
        get users_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'without sign in user' do
      it 'should be redirect to root path' do
        get users_path
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'GET /show' do
    let(:user) { create(:user) }
    context 'with sign in user' do
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        get user_path(user)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'without sign user' do
      it 'should be redirect to root path' do
        get user_path(user)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'POST /change_status' do
    context 'without sign in user' do
      it 'should be redirect to root path' do
        post change_status_user_path(user), params: { status: 'test' }
        expect(response).to have_http_status(:found)
      end
    end

    let(:user) { create(:user) }
    context 'with sign in user' do
      before(:each) do
        sign_in user
      end

      it 'should be no content' do
        post change_status_user_path(2), params: { status: 'test' }
        expect(response).to have_http_status(:found)
      end

      it 'should be change status' do
        post change_status_user_path(user), params: { status: 'test' }, headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:found)
        expect(User.first.status).to eq('test')
      end
    end
  end

  describe 'GET /photos' do
    let(:user) { create(:user) }
    context 'with sign in user' do
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        get photos_user_path(user)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'without sign in user' do
      it 'should be redirect to root path' do
        get photos_user_path(user)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
