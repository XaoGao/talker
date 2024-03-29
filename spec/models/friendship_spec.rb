# == Schema Information
#
# Table name: friendships
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  subscriber_id :bigint           not null
#  user_id       :bigint
#
# Indexes
#
#  index_friendships_on_subscriber_id  (subscriber_id)
#  index_friendships_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (subscriber_id => users.id)
#
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
