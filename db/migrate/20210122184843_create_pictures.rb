class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :title, default: "", null: false
      t.boolean :is_main, default: false, null: false
      t.bigint :imageable_id, null: false
      t.string :imageable_type, null: false
      t.timestamps
    end
  end
end
