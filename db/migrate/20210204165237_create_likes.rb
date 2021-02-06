class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.bigint :likeable_id, null: false
      t.string :likeable_type, null: false
      t.references :user, references: :user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
