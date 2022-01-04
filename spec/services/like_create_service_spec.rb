require 'rails_helper'

RSpec.describe LikeService::LikeCreate do
  describe '.call' do
    let(:subject) { LikeService::LikeCreate }
    context 'success' do
      let(:user) { create(:user) }
      let(:likeable) { create(:comment) }

      it 'should be create a new like' do
        result = subject.call(user: user, likeable_type: likeable.class.to_s, likeable_id: likeable.id)
        expect(result.success?).to be true
        expect(Like.all.count).to eq(1)
      end

      it 'should be destroy a exited like' do
        Like.create(user: user, likeable_type: likeable.class.to_s, likeable_id: likeable.id)
        result = subject.call(user: user, likeable_type: likeable.class.to_s, likeable_id: likeable.id)
        expect(result.success?).to be true
        expect(Like.all.count).to eq(0)
      end
    end
  end
end
