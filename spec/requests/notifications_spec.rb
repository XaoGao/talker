require 'rails_helper'

RSpec.describe 'Notifications', type: :request do
  describe 'GET /index' do
    context 'when user is not sign in' do
      it 'should redirect to sign in page' do
        get notifications_path
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
        get notifications_path
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
