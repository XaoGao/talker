# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :text             default(""), not null
#  is_read    :boolean          default(FALSE), not null
#  lock       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dialog_id  :bigint           not null
#  sender_id  :bigint           not null
#
# Indexes
#
#  index_messages_on_dialog_id  (dialog_id)
#  index_messages_on_sender_id  (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (dialog_id => dialogs.id)
#  fk_rails_...  (sender_id => users.id)
#
class Message < ApplicationRecord
  include Orderable
  belongs_to :dialog, dependent: :destroy
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id', dependent: :destroy
  validates :body, presence: true, length: { maximum: 500 }

  def read_message(user)
    update(is_read: true) if is_read == false && sender != user
  end
end
