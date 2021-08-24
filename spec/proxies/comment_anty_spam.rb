require 'rails_helper'

RSpec.describe CommentProxy::CommentAntySpam do
  context '.save' do
    let(:comment) { build(:command, body: 'message') }
    let(:spam_comment) { build(:command, body: 'weather') }

    it 'should be a saved without a spam flag' do
      CommentProxy::CommentAntySpam.new(spam_comment).save
      expect(spam_comment.spam).to be true
    end

    it 'should be a saved with a spam flag' do
      CommentProxy::CommentAntySpam.new(command).save
      expect(comment.spam).to be true
    end
  end

  context '.update' do
    let(:comment) { create(:command, body: 'message', spam: false) }
    let(:spam_comment) { create(:command, body: 'message', spam: true) }

    it 'should be a updated body and set false for a spam flag' do
      spam_comment.body = 'another message'
      CommentProxy::CommentAntySpam.new(spam_comment).update
      expect(spam_comment.spam).to be false
    end

    it 'should be a updated body and set false for a spam flag' do
      comment.body = 'weather'
      CommentProxy::CommentAntySpam.new(comment).update
      expect(comment.spam).to be true
    end
  end
end
