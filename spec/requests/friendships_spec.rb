require 'rails_helper'

RSpec.describe 'Friendships', type: :request do
  # describe 'GET /index' do
  #   context 'with sign in user' do
  #     let(:user) { create(:user) }
  #     before(:each) do
  #       sign_in user
  #     end
  #     it 'should be a success response' do
  #       get friendships_path
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
  #   context 'without sign in user' do
  #     it 'should be redirect to root path' do
  #       get friendships_path
  #       expect(response).to have_http_status(:found)
  #     end
  #   end
  # end
  describe 'GET /subscriptions' do
    let(:user) { create(:user) }
    context 'with sign in user' do
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        get subscribers_user_path(user)
        expect(response).to have_http_status(:ok)
      end
    end
    context 'without sign in user' do
      it 'should be redirect to root path' do
        get subscribers_user_path(user)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'GET /subscribers' do
    let(:user) { create(:user) }
    context 'with sign in user' do
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        get subscribers_user_path(user)
        expect(response).to have_http_status(:ok)
      end
    end
    context 'without sign in user' do
      it 'should be redirect to root path' do
        get subscribers_user_path(user)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'POST /friendships' do
    context 'with sign in user' do
      let(:user) { create(:user) }
      let(:friendship) { create(:user) }
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        post friendships_path, params: { user: friendship.id }, headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(root_path)
      end
    end
    context 'without sign in user' do
      it 'should be redirect to root path' do
        post friendships_path
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'DELETE /destroy' do
    let(:subscriber) { create(:user) }
    context 'with sign in user' do
      let(:user) { create(:user) }
      let(:friendship) { create(:friendship, user: user, subscriber: subscriber) }
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        delete friendship_path(subscriber.slug), headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(root_path)
      end
    end
    context 'without sign in user' do
      it 'should be redirect to root path' do
        delete friendship_path(subscriber.slug), headers: { 'HTTP_REFERER' => root_path }
        expect(response).to have_http_status(:found)
      end
    end
  end
end
