require 'rails_helper'

RSpec.describe Dialog, type: :model do
  describe 'methods' do
    let(:sender)   { create(:user) }
    let(:consumer) { create(:user) }
    let(:dialog)   { create(:dialog) }
    let(:dialog_with_messags) { create(:dialog, messages: create_list(:message, 3)) }
    let(:dialog_with_read_messags) { create(:dialog, messages: create_list(:message, 3, is_read: true)) }
    let(:dialog_with_sender_and_message) { create(:dialog, messages: create_list(:message, 3, sender: sender)) }
    let(:dialog_with_sender_and_read_message) { create(:dialog, messages: create_list(:message, 3, sender: sender, is_read: true)) }
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

    context '.create_time_of_last_message' do
      let(:message) { create(:message, created_at: '2021-02-23 19:01:50.368544') }
      it 'have messages' do
        dialog_with_messags.messages << message
        expect(dialog_with_messags.create_time_of_last_message).to eq('23/02/2021')
      end

      it 'without messages' do
        expect(dialog.create_time_of_last_message).to eq('')
      end
    end

    context '.unread_messages?' do
      it 'consumer have messages' do
        unread_messages = dialog_with_sender_and_message.unread_messages? consumer
        expect(unread_messages).to be true
      end

      it 'consumer havent unread messages' do
        unread_messages = dialog_with_sender_and_read_message.unread_messages? consumer
        expect(unread_messages).to be false
      end

      it 'unconsumer havent unread messages' do
        unread_messages = dialog_with_sender_and_message.unread_messages? sender
        expect(unread_messages).to be false
      end
    end

    context '.unread_messages_count' do
      it 'have only unread message' do
        unread_messages_count = dialog_with_sender_and_message.unread_messages_count consumer
        expect(unread_messages_count).to eq(3)
      end

      it 'have some unread message' do
        dialog_with_sender_and_message.messages.first.update(is_read: true)
        unread_messages_count = dialog_with_sender_and_message.unread_messages_count consumer
        expect(unread_messages_count).to eq(2)
      end

      it 'unconsumer havent unread messages' do
        unread_messages_count = dialog_with_sender_and_message.unread_messages_count sender
        expect(unread_messages_count).to eq(0)
      end
    end

    context '.name_all_members' do
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
  end
end
