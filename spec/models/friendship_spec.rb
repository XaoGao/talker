require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'methods' do
    context '.subscriptions' do
      let!(:user) { create(:user) }
      let!(:friendships) { create_list(:friendship, 3, subscriber: user) }

      it 'all subscriptions' do
        subscriptions = Friendship.subscriptions user
        expect(subscriptions.count).to eq(3)
      end
    end
  end
end
