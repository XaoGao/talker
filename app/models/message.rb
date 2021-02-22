class Message < ApplicationRecord
  belongs_to :dialog
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  validates :boddy, presence: true, length: { maximum: 500 }

  def message_read(user)
    update(is_read: true) if !is_read && sender != user
  end
end
