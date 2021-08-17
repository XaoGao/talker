require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    context 'with sign in user' do
      before(:each) do
        sign_in create(:user)
      end

      it 'should be success response' do
        get users_path
        expect(response).to have_http_status(200)
      end
    end

    context 'without sign in user' do
      it 'should be redirect to root path' do
        get users_path
        expect(response).to have_http_status(302)
      end
    end
  end
end
