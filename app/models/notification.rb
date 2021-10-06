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
class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }

  after_create :test_send

  def test_send
    ActionCable.server.broadcast "notifications_channel:#{recipient.id}", data: self
  end
end
