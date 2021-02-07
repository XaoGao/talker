class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body, default: "", null: false
      t.boolean :lock, default: false, null: false
      t.references :user, references: :user, null: false, foreign_key: { to_table: :users }
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end
