require 'rails_helper'

RSpec.describe FriendshipService::FriendshipDestroy do
  describe '.call' do
    let(:subject) { FriendshipService::FriendshipDestroy }
    let(:user) { create(:user) }
    let(:subscriber) { create(:user) }
    let(:friendship) { create(:friendship, user: user, subscriber: subscriber) }

    context 'have a valid user and subscriber' do
      it 'should be a error response user is not exist' do
        expect(subject.call(user_id: 'test', subscriber: subscriber).success?).to be false
        expect(Friendship.all.count).to eq(0)
      end

      it 'should be desroy the friendship with success result' do
        expect(subject.call(user_id: user.slug, subscriber: subscriber).success?).to be true
        expect(Friendship.all.count).to eq(1)
      end
    end

    context 'have not a valid user' do
      let(:subscriber) { create(:user) }
      it 'should be a error result' do
        expect(subject.call(user_id: 'fake slug', subscriber: subscriber).success?).to be false
      end

      it 'should not find a friendship' do
        expect(subject.call(user_id: user.slug, subscriber: 'fake subscriber').success?).to be false
      end
    end
  end
end
