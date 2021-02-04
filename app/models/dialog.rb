class Dialog < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  has_many :dialog_members
  has_many :members, through: :dialog_members

  has_many :messages

  validates :name, presence: true, length: { maximum: 150 }

  def body_of_last_messages
    if messages.last.present?
      messages.last.body
    else
      ''
    end
  end

  def create_time_of_last_message
    if messages.last.present?
      messages.last.created_at
    else
      ''
    end
  end

  def name_all_members(user)
    all_names = []
    members.each do |member|
      all_names << member.username unless user == member
    end
    all_names.join(', ')
  end
end
