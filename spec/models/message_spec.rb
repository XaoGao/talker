require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    context 'require field' do
      it { should validate_presence_of(:body) }
    end

    context 'lenght' do
      it { should validate_length_of(:body).is_at_most(500) }
    end
  end

  describe 'methods' do
    context '.read_message' do
      let(:message) { create(:message) }
      let(:sender)  { create(:user) }
      let(:user)    { create(:user) }

      it 'another user read message' do
        message.read_message user
        expect(message.is_read).to be true
      end

      it 'sender read message' do
        message.sender = sender
        message.read_message sender
        expect(message.is_read).to be false
      end
    end
  end
end
