require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    context 'require field' do
      it 'ensures username presence' do
        user = build(:user, username: '')
        user.valid?
        expect(user.errors.full_messages).to include("Username can't be blank")
      end

      it 'ensures first_name presence' do
        user = build(:user, first_name: '')
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ensures last_name presence' do
        user = build(:user, last_name: '')
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
    end
  end
end
