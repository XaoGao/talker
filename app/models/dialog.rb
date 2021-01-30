class Dialog < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  has_many :dialog_members
  has_many :members, through: :dialog_members

  has_many :messages

  validates :name, presence: true, length: { maximum: 150 }
end
