# == Schema Information
#
# Table name: dialog_members
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dialog_id  :bigint           not null
#  member_id  :bigint           not null
#
# Indexes
#
#  index_dialog_members_on_dialog_id  (dialog_id)
#  index_dialog_members_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (dialog_id => dialogs.id)
#  fk_rails_...  (member_id => users.id)
#
FactoryBot.define do
  factory :dialog_member do
    association :member, factory: :user
    association :dialog, factory: :dialog
    created_at { DateTime.now }
  end
end
