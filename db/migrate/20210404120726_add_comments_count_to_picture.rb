class AddCommentsCountToPicture < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :comments_count, :integer, default: 0, null: false
  end
end
