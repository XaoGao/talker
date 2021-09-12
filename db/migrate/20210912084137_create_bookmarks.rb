class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.bigint :bookmarkable_id, null: false
      t.string :bookmarkable_type, null: false
      t.references :user, references: :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
