# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  city                   :string           default(""), not null
#  comments_count         :integer          default(0), not null
#  country                :string           default(""), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  date_of_birth          :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  gender                 :integer          default("not_set"), not null
#  interests              :string           default(""), not null
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  likes_count            :integer          default(0), not null
#  locale                 :string           default("en")
#  lock                   :boolean          default(FALSE), not null
#  online                 :boolean          default(FALSE), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default(NULL), not null
#  sign_in_count          :integer          default(0), not null
#  slug                   :string
#  status                 :string           default(""), not null
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'require field' do
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
    end

    context 'field length' do
      it { should validate_length_of(:username).is_at_most(150) }
      it { should validate_length_of(:first_name).is_at_most(50) }
      it { should validate_length_of(:last_name).is_at_most(50) }

      it { should validate_length_of(:last_name).is_at_least(2) }
      it { should validate_length_of(:last_name).is_at_least(2) }
    end

    context 'uniqueness' do
      it { should validate_uniqueness_of(:username).case_insensitive }
    end
  end

  describe 'methods' do
    context 'scopes' do
      before(:each) do
        create_list(:user, 2)
        create(:user, lock: true)
      end

      it '#active_user' do
        all_user = User.all
        active_user = User.actived

        expect(all_user.size).to eq(3)
        expect(active_user.size).to eq(2)
      end

      it 'all_user_exept_one' do
        user = User.first
        all_user_except_one = User.all_except(user)

        expect(User.all.size).to eq(3)
        expect(User.all.include?(user)).to be true
        expect(all_user_except_one.size).to eq(2)
        expect(all_user_except_one.include?(user)).to be false
      end
    end

    context '#full name' do
      let(:user) { build(:user, first_name: 'Jon', last_name: 'James') }
      it 'full name of user' do
        expect(user.full_name).to eq('James Jon')
      end
    end

    context '#location' do
      let(:user) { build(:user, country: 'USA', city: 'Minsk') }
      it 'full location' do
        expect(user.location).to eq('USA, Minsk')
      end

      it 'only country' do
        user.city = ''
        expect(user.location).to eq('USA')
      end

      it 'only city' do
        user.country = ''
        expect(user.location).to eq('Minsk')
      end

      it 'without country, city' do
        user.country = ''
        user.city = ''
        expect(user.location).to eq('-')
      end
    end

    context '#gender' do
      let(:user) { create(:user, gender: 0) }
      it 'not set' do
        expect(user.gender).to eq('not_set')
        expect(user.gender_name).to eq(I18n.t('users.gender.not_set'))
      end

      it 'woman' do
        user.gender = 2
        expect(user.gender).to eq('woman')
        expect(user.gender_name).to eq(I18n.t('users.gender.woman'))
      end

      it 'man' do
        user.gender = 1
        expect(user.gender).to eq('man')
        expect(user.gender_name).to eq(I18n.t('users.gender.man'))
      end

      it 'another' do
        user.gender = 3
        expect(user.gender).to eq('another')
        expect(user.gender_name).to eq(I18n.t('users.gender.another'))
      end
    end

    context '#subscriptions' do
      let!(:user) { create(:user) }
      let(:user2) { create(:user) }

      it 'have subscriptions' do
        create_list(:friendship, 3, subscriber: user)
        expect(user.subscriptions.count).to eq(3)
      end

      it "haven't subscriptions" do
        create_list(:friendship, 3, subscriber: user2)
        expect(user.subscriptions.count).to eq(0)
      end
    end

    context '#alredy_subscription?' do
      let!(:user) { create(:user) }
      let!(:friend) { create(:user) }

      it 'have subscription' do
        create(:friendship, user: user, subscriber: friend)

        expect(user.alredy_subscription?(friend)).to be true
      end

      it "haven't subscription" do
        expect(user.alredy_subscription?(friend)).to be false
      end
    end

    context '#any_unread_messages?' do
      let(:user) { create(:user) }
      it 'have unread messages' do
        user.dialogs << create(:dialog, messages: create_list(:message, 3))
        expect(user.any_unread_messages?).to be true
      end

      it 'have only read messages' do
        user.dialogs << create(:dialog, messages: create_list(:message, 3, is_read: true))
        expect(user.any_unread_messages?).to be false
      end
    end

    context '#all_unread_messages' do
      let(:user) { create(:user) }
      it 'have unread messages' do
        user.dialogs << create(:dialog, messages: create_list(:message, 3))
        expect(user.all_unread_messages).to eq(3)
      end

      it 'have only read messages' do
        user.dialogs << create(:dialog, messages: create_list(:message, 3, is_read: true))
        expect(user.all_unread_messages).to eq(0)
      end
    end

    context '.filter' do
      let!(:users) { create_list(:user, 5) }
      it 'by first_name' do
        create(:user, first_name: 'test')
        params = { first_name: 'test' }
        expect(User.all.count).to eq(6)
        expect(User.filter(params).count).to eq(1)
      end

      it 'by last name' do
        create(:user, last_name: 'test')
        params = { last_name: 'test' }
        expect(User.all.count).to eq(6)
        expect(User.filter(params).count).to eq(1)
      end

      it 'by username' do
        create(:user, username: 'test')
        params = { username: 'test' }
        expect(User.all.count).to eq(6)
        expect(User.filter(params).count).to eq(1)
      end
    end
  end
end
