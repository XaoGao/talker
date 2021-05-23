require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    context 'require fields' do
      it { should validate_presence_of(:body) }
    end
    context 'length' do
      it { should validate_length_of(:body).is_at_most(1000) }
    end
  end
end
