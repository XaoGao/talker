require 'rails_helper'

describe DialogService::DialogGetOrCreate do
  describe '.call' do
    let(:owner_member) { create(:user) }
    let(:second_member) { create(:user) }
    context 'when dialog is exist' do
      let(:dialog) { create(:dialog, owner: owner_member) }

      it 'should return the dialog' do
        create(:dialog_member, member: owner_member, dialog: dialog)
        create(:dialog_member, member: second_member, dialog: dialog)

        expect(described_class.call(owner_member: owner_member, second_member: second_member)).to eq(dialog)
      end
    end

    context 'when a dialog is not exist' do
      it 'should create a new dialog with members' do
        dialog = described_class.call(owner_member: owner_member, second_member: second_member)
        expect(dialog.id).to eq(1)
        expect(dialog.owner).to eq(owner_member)
      end
    end
  end
end
