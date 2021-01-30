class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body, default: "", null: false
      t.boolean :lock, default: false, null: false
      t.references :sender, references: :user, null: false, foreign_key: { to_table: :users }
      t.references :dialog, references: :dialog, null: false, foreign_key: { to_table: :dialogs }

      t.timestamps
    end
  end
end
