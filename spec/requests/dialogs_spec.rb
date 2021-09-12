require 'rails_helper'

RSpec.describe 'Dialogs', type: :request do
  describe 'GET /index' do
    let(:user) { create(:user) }
    let(:dialogs) { build_list(:dialog, 2, owner: user) }
    context 'with sign in user' do
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        get dialogs_path
        expect(response).to have_http_status(:ok)
      end
    end
    context 'without sign in user' do
      it 'should be a redirect to root response' do
        get dialogs_path
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /show' do
    let(:user) { create(:user) }
    let(:dialog) { create(:dialog, owner: user) }
    context 'with sign in user' do
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        get dialog_path(dialog)
        expect(response).to have_http_status(:ok)
      end
    end
    context 'without sign in user' do
      it 'should be a redirect to root response' do
        get dialog_path(dialog)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /create' do
    let(:user) { create(:user) }
    let(:dialog) { build(:dialog) }
    context 'with sign in user' do
      before(:each) do
        sign_in user
      end
      it 'should be a success response' do
        post dialogs_path, params: dialog.attributes.merge({ user: user.id })
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(dialog_path(1))
      end

      it 'should be a error response' do
        post dialogs_path, params: dialog.attributes.merge({ user: 0 })
        expect(response).to have_http_status(:found)
        expect(flash[:alert]).to match(I18n.t('dialogs.create.error'))
      end
    end
    context 'without sign in user' do
      it 'should be a redirect to root response' do
        post dialogs_path, params: dialog.attributes
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
