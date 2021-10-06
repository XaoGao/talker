class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :recipient, references: :user, null: false, foreign_key: { to_table: :users }
      t.references :actor, references: :user, null: false, foreign_key: { to_table: :users }
      t.datetime :read_at
      t.bigint :notifiable_id, null: false
      t.string :notifiable_type, null: false
      t.string :action
      t.timestamps
    end
  end
end
