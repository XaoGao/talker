class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :body,    null: false, default: ""
      t.boolean :lock, null: false, default: false
      t.references :author, references: :user, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
