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
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

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

  def self.get_or_create(user1, user2)
    dialog_members = DialogMember.where(member: [user1, user2])
    return create_dialog_with_members(user1, user2) if dialog_members.empty?

    members_in_one_dialog = dialog_members.group_by(&:dialog).find { |d| d.second.count == 2 }
    return create_dialog_with_members(user1, user2) if members_in_one_dialog.nil?

    members_in_one_dialog.first
  end

  def self.create_dialog_with_members(user1, user2)
    dialog = Dialog.new(owner: user1)
    DialogMember.create(member: user1, dialog: dialog)
    DialogMember.create(member: user2, dialog: dialog)
    dialog
  end
end
