# == Schema Information
#
# Table name: dialogs
#
#  id         :integer          not null, primary key
#  lock       :boolean          default(FALSE), not null
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer          not null
#
# Indexes
#
#  index_dialogs_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  owner_id  (owner_id => users.id)
#
require 'rails_helper'

RSpec.describe Dialog, type: :model do
  describe 'methods' do
    let(:sender)   { create(:user) }
    let(:consumer) { create(:user) }
    let(:dialog)   { create(:dialog) }
    let(:dialog_with_messags) { create(:dialog, messages: create_list(:message, 3)) }
    let(:dialog_with_read_messags) { create(:dialog, messages: create_list(:message, 3, is_read: true)) }
    let(:dialog_with_sender_and_message) { create(:dialog, messages: create_list(:message, 3, sender: sender)) }
    let(:dialog_with_sender_and_read_message) do
      create(:dialog, messages: create_list(:message, 3, sender: sender, is_read: true))
    end

    context '.body_of_last_messages' do
      let(:message) { create(:message, body: 'test') }

      it 'have messages' do
        dialog_with_messags.messages << message
        expect(dialog_with_messags.body_of_last_messages).to eq('test')
      end

      it 'without messages' do
        expect(dialog.body_of_last_messages).to eq('')
      end
    end

    context '#unread_messages?' do
      it 'consumer have messages' do
        unread_messages = dialog_with_sender_and_message.unread_messages? consumer
        expect(unread_messages).to be true
      end

      it "consumer haven't unread messages" do
        unread_messages = dialog_with_sender_and_read_message.unread_messages? consumer
        expect(unread_messages).to be false
      end

      it "unconsumer haven't unread messages" do
        unread_messages = dialog_with_sender_and_message.unread_messages? sender
        expect(unread_messages).to be false
      end
    end

    context '#unread_messages_count' do
      it 'have only unread messages' do
        unread_messages_count = dialog_with_sender_and_message.unread_messages_count consumer
        expect(unread_messages_count).to eq(3)
      end

      it 'have some unread messages' do
        dialog_with_sender_and_message.messages.first.update(is_read: true)
        unread_messages_count = dialog_with_sender_and_message.unread_messages_count consumer
        expect(unread_messages_count).to eq(2)
      end

      it "unconsumer haven't unread messages" do
        unread_messages_count = dialog_with_sender_and_message.unread_messages_count sender
        expect(unread_messages_count).to eq(0)
      end
    end

    context '#name_all_members' do
      let(:user) { create(:user) }
      it 'dialog name for user' do
        dialog.dialog_members << DialogMember.create(member: sender)
        dialog.dialog_members << DialogMember.create(member: consumer)

        expect(dialog.name_all_members(sender)).to eq(consumer.username)
        expect(dialog.name_all_members(consumer)).to eq(sender.username)
      end

      it 'dialog name for some users' do
        dialog.dialog_members << DialogMember.create(member: sender)
        dialog.dialog_members << DialogMember.create(member: consumer)
        dialog.dialog_members << DialogMember.create(member: user)

        expect(dialog.name_all_members(sender)).to eq("#{consumer.username}, #{user.username}")
        expect(dialog.name_all_members(consumer)).to eq("#{sender.username}, #{user.username}")
      end
    end

    # context '.create_dialog_with_members' do
    #   let(:user1) { create(:user) }
    #   let(:user2) { create(:user) }
    #   it 'successfully create a new dialog between users' do
    #     dialog = Dialog.create_dialog_with_members(user1, user2)
    #     expect(dialog.members.count).to eq(2)
    #     expect(dialog.members.first).to eq(user1)
    #     expect(dialog.members.last).to eq(user2)
    #   end
    # end

    # context '.get_or_create' do
    #   let(:user1) { create(:user) }
    #   let(:user2) { create(:user) }
    #   let(:dialog) { create(:dialog) }
    #   it "dialog between users doesn't exist" do
    #     dialog = Dialog.get_or_create(user1, user2)
    #     expect(dialog.members.include?(user1)).to be true
    #     expect(dialog.members.include?(user2)).to be true
    #   end
    #   it 'dialog between users exist' do
    #     dialog.dialog_members.create(member: user1)
    #     dialog.dialog_members.create(member: user2)
    #     dialog = Dialog.get_or_create(user1, user2)
    #     expect(dialog.members.include?(user1)).to be true
    #     expect(dialog.members.include?(user2)).to be true
    #   end
    # end
  end
end
