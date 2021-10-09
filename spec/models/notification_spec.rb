# == Schema Information
#
# Table name: notifications
#
#  id              :integer          not null, primary key
#  action          :string
#  notifiable_type :string           not null
#  read_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  actor_id        :integer          not null
#  notifiable_id   :bigint           not null
#  recipient_id    :integer          not null
#
# Indexes
#
#  index_notifications_on_actor_id      (actor_id)
#  index_notifications_on_recipient_id  (recipient_id)
#
# Foreign Keys
#
#  actor_id      (actor_id => users.id)
#  recipient_id  (recipient_id => users.id)
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'methods' do
    context '#unread' do
      let(:actor) { create(:user) }
      let(:recipient) { create(:user) }
      let!(:notification_unread) { create_list(:notification, 3, actor: actor, recipient: recipient, read_at: nil) }
      let!(:notification_read) { create_list(:notification, 2, actor: actor, recipient: recipient, read_at: DateTime.now) }
      it 'should return all notification for user without read_at' do
        expect(Notification.unread.count).to eq(3)
      end
    end
  end
end
