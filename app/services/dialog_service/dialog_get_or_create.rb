module DialogService
  class DialogGetOrCreate < Service
    def call(user1, user2)
      dialog_members = DialogMember.where(member: [user1, user2])
      return create_dialog_with_members(user1, user2) if dialog_members.empty?

      members_in_one_dialog = dialog_members.group_by(&:dialog).find { |d| d.second.count == 2 }
      return create_dialog_with_members(user1, user2) if members_in_one_dialog.nil?

      members_in_one_dialog.first
    end

    def create_dialog_with_members(user1, user2)
      dialog = Dialog.new(owner: user1)
      DialogMember.create(member: user1, dialog: dialog)
      DialogMember.create(member: user2, dialog: dialog)
      dialog
    end
  end
end
