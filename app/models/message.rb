# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text             default(""), not null
#  is_read    :boolean          default(FALSE), not null
#  lock       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dialog_id  :integer          not null
#  sender_id  :integer          not null
#
# Indexes
#
#  index_messages_on_dialog_id  (dialog_id)
#  index_messages_on_sender_id  (sender_id)
#
# Foreign Keys
#
#  dialog_id  (dialog_id => dialogs.id)
#  sender_id  (sender_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :dialog
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  validates :body, presence: true, length: { maximum: 500 }

  def read_message(user)
    update(is_read: true) if is_read == false && sender != user
  end
end
