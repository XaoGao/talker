class Message < ApplicationRecord
  belongs_to :dialog
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  validates :body, presence: true, length: { maximum: 500 }

  def read_message(user)
    update(is_read: true) if is_read == false && sender != user
  end
end
