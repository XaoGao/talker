class CreateDialogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dialogs do |t|
      t.string :name, default: "", null: false
      t.references :owner, references: :user, null: false, foreign_key: { to_table: :users }
      t.boolean :lock, default: false, null: false

      t.timestamps
    end
  end
end
