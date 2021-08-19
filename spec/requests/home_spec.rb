require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /welcome' do
    context 'with sign in user' do
      let(:user) { build(:user) }
      before(:each) do
        sign_in user
      end

      it 'should be a redirect to articles path' do
        get root_path
        expect(response).to redirect_to(articles_path)
      end
    end
    context 'without sign in user' do
      it 'should be a success response' do
        get root_path
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
