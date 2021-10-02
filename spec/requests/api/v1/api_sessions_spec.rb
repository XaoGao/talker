require 'rails_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  describe 'POST /create' do
    context 'login' do
      let(:user) { create(:user, email: 't@t.t', password: 'password') }
      let(:session_params) { { email: user.email, password: user.password } }
      it 'should be a success response' do
        post api_v1_login_path, params: session_params
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body).include?('token')).to be true
      end

      it 'should be a bad request have not email in body' do
        session_params[:email] = nil
        post api_v1_login_path, params: session_params
        expect(response).to have_http_status(:bad_request)
      end

      it 'should be a bad request have not password in body' do
        session_params[:password] = nil
        post api_v1_login_path, params: session_params
        expect(response).to have_http_status(:bad_request)
      end

      it 'should be a bad request user not found' do
        session_params[:email] = ''
        post api_v1_login_path, params: session_params
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
