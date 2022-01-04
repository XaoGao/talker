require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'GET /index' do
    context 'with sign in user' do
      let(:user) { create(:user) }
      before(:each) do
        sign_in user
      end

      it 'should be a success response' do
        get games_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'without sign in user' do
      it 'should be redirect to root path' do
        get games_path
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
