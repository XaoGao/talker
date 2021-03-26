require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'require field' do
      it 'ensures username presence' do
        user = build(:user, username: '')
        expect(user.save).to eq(false)
        expect(user.errors.full_messages).to include("Username can't be blank")
      end

      it 'ensures first_name presence' do
        user = build(:user, first_name: '')
        expect(user.save).to eq(false)
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ensures last_name presence' do
        user = build(:user, last_name: '')
        expect(user.save).to eq(false)
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
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
  end
end
