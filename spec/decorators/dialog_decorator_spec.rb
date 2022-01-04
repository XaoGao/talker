require 'rails_helper'

RSpec.describe DialogDecorator do
  let(:message) { create(:message, created_at: '2021-01-24 11:33:05.877543') }
  let(:dialog) { build(:dialog) }
  subject(:dialog_decorator) { dialog.decorate }

  describe '.create_time_of_last_message' do
    it 'when dialog have not message' do
      expect(subject.create_time_of_last_message).to eq('')
    end

    it 'when dialog have messages' do
      dialog.messages << message
      expect(subject.create_time_of_last_message).to eq('24/01/2021')
    end
  end
end
