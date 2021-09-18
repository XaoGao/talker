class CreateToggleServices < ActiveRecord::Migration[6.0]
  def change
    create_table :toggle_services do |t|
      t.string :name, null: false
      t.string :env, null: false
      t.boolean :work, default: true

      t.timestamps
    end
  end
end
