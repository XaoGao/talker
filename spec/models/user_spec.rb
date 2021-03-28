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
    context 'scope' do
      before(:each) do
        create_list(:user, 2)
        create(:user, lock: true)
      end

      it 'active user' do
        all_user = User.all
        active_user = User.all_active

        expect(all_user.size).to eq(3)
        expect(active_user.size).to eq(2)
      end

      it 'all user exept one' do
        user = User.first
        all_user_except_one = User.all_except(user)

        expect(User.all.size).to eq(3)
        expect(User.all.include?(user)).to be true
        expect(all_user_except_one.size).to eq(2)
        expect(all_user_except_one.include?(user)).to be false
      end
    end

    context '.full name' do
      let(:user) { build(:user, first_name: 'Jon', last_name: 'James') }
      it 'full name of user' do
        expect(user.full_name).to eq('James Jon')
      end
    end

    context '.location' do
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
  end
end
