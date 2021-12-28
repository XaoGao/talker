require 'rails_helper'

RSpec.describe FriendshipService::FriendshipCreate do
  describe '.call' do
    let(:subject) { FriendshipService::FriendshipCreate }
    context 'have a valid user and subscriber' do
      let(:user) { create(:user) }
      let(:subscriber) { create(:user) }

      it 'should be create a new friendship with success result' do
        expect(subject.call(user_id: user.slug, subscriber: subscriber).success?).to be true
        expect(Friendship.all.count).to eq(1)
      end
    end

    context 'have not a valid user' do
      let(:subscriber) { create(:user) }
      it 'should be a error result' do
        expect { subject.call(user_id: 'fake slug', subscriber: subscriber) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
