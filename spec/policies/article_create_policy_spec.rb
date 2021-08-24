require 'rails_helper'

RSpec.describe ArticlePolicy::ArticleCreatePolicy do
  context '#create?' do
    let(:user_lock) { create(:user, lock: true) }
    let(:user_unlock) { create(:user, lock: false) }
    let(:subject) { ArticlePolicy::ArticleCreatePolicy }
    it 'can create' do
      expect(subject.create?(user_lock)).to be false
    end

    it "can't create" do
      expect(subject.create?(user_unlock)).to be true
    end
  end
end
