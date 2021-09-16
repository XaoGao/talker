module DialogService
  class DialogGetOrCreate < Service
    include Callable
    def call(owner_member:, second_member:)
      dialog_members = DialogMember.where(member: [owner_member, second_member])
      return create_dialog_with_members(owner_member, second_member) if dialog_members.empty?

      members_in_one_dialog = dialog_members.group_by(&:dialog).find { |d| d.second.count == 2 }
      return create_dialog_with_members(owner_member, second_member) if members_in_one_dialog.nil?

      members_in_one_dialog.first
    end

    private

    def create_dialog_with_members(owner_member, second_member)
      dialog = Dialog.new(owner: owner_member)
      DialogMember.create(member: owner_member, dialog: dialog)
      DialogMember.create(member: second_member, dialog: dialog)
      dialog
    end
  end
end
