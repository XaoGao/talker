# == Schema Information
#
# Table name: dialog_members
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dialog_id  :integer          not null
#  member_id  :integer          not null
#
# Indexes
#
#  index_dialog_members_on_dialog_id  (dialog_id)
#  index_dialog_members_on_member_id  (member_id)
#
# Foreign Keys
#
#  dialog_id  (dialog_id => dialogs.id)
#  member_id  (member_id => users.id)
#
class DialogMember < ApplicationRecord
  belongs_to :member, class_name: 'User', foreign_key: 'member_id', dependent: :destroy
  belongs_to :dialog, dependent: :destroy
end
