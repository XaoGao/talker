require 'rails_helper'

RSpec.describe CommentProxy::SpamFilter do
  context '.spam?' do
    it 'should be a ban' do
      message = 'it is a message with a ban word weather'
      expect(subject.spam?(message)).to be true
    end

    it 'should not be a ban' do
      message = 'it is a message without a ban word'
      expect(subject.spam?(message)).to be false
    end
  end
end
