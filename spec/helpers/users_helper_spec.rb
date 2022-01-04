require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  context '.online_label' do
    let(:user_offline_without_last_sign_in) { build(:user, online: false, last_sign_in_at: nil) }
    let(:user_offline_with_last_sign_in) do
      build(:user, online: false, last_sign_in_at: DateTime.new(2001, 2, 3, 4, 5, 6, '+7'))
    end
    let(:user_online) { build(:user, online: true, last_sign_in_at: DateTime.new(2001, 2, 3, 4, 5, 6, '+7')) }

    it 'when user online' do
      expect(online_label(user_online)).to eq('online')
    end

    it 'when user offline and have not last_sign_in_at' do
      expect(online_label(user_offline_without_last_sign_in)).to eq('offline')
    end

    it 'when user offline and have last_sign_in_at' do
      expect(online_label(user_offline_with_last_sign_in)).to eq(time_ago_in_words(user_offline_with_last_sign_in.last_sign_in_at))
    end
  end
end
