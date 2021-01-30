class CreateDialogMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :dialog_members do |t|
      t.references :member, references: :user, null: false, foreign_key: { to_table: :users }
      t.references :dialog, references: :dialog, null: false, foreign_key: { to_table: :dialogs }
      t.timestamps
    end
  end
end
