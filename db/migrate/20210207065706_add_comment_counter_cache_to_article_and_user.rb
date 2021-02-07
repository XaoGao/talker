class AddCommentCounterCacheToArticleAndUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :comments_count, :integer, default: 0, null: false
    add_column :articles, :comments_count, :integer, default: 0, null: false
  end
end
