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
FactoryBot.define do
  factory :message do
    body { Faker::Lorem.paragraph(sentence_count: 3) }
    lock { false }
    association :sender, factory: :user
    association :dialog, factory: :dialog
    is_read { false }
    created_at { DateTime.now }
  end
end
