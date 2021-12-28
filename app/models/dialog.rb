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
class Dialog < ApplicationRecord
  include Orderable
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', dependent: :destroy

  has_many :dialog_members
  has_many :members, through: :dialog_members

  has_many :messages

  # validates :name, presence: true, length: { maximum: 150 }

  scope :with_sender, -> { includes([:sender]) }

  def body_of_last_messages
    if messages.last.present?
      messages.last.body
    else
      ''
    end
  end

  def create_time_of_last_message
    if messages.last.present?
      messages.last.created_at.strftime('%d/%m/%Y')
    else
      ''
    end
  end

  def name_all_members(user)
    members.where.not(username: user.username).map(&:username).join(', ')
  end

  def unread_messages_count(user)
    messages.where.not(sender: user).where.not(is_read: true).count
  end

  def unread_messages?(user)
    messages.where.not(sender: user).where.not(is_read: true).any?
  end
end
