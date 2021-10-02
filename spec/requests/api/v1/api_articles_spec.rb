require 'rails_helper'

RSpec.describe 'Api::V1::Articles', type: :request do
  describe 'GET /index' do
    let!(:articles) { create_list(:article, 4, body: 'test') }
    let!(:user) { create(:user) }

    it 'should be a success response' do
      get api_v1_articles_path, params: { query: 'test' }, headers: RequestHelper.authenticated_header(user)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).include?('result')).to be true
    end
  end
end
