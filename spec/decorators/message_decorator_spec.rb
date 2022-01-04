require 'rails_helper'

RSpec.describe MessageDecorator do
  let(:message) { build(:message, created_at: '2021-01-24 11:33:05.877543') }
  subject(:message_decorator) { message.decorate }

  describe '.created_time' do
    it { expect(subject.created_time).to eq('11:33') }
  end
end
