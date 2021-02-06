class AddCounterCacheToArticleAndUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :likes_count, :integer, default: 0, null: false
    add_column :articles, :likes_count, :integer, default: 0, null: false
  end
end
