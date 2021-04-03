class AddSpamFlagToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :spam, :boolean, default: false, null: false
    Comment.all.each do |c|
      c.update(spam: false)
    end
  end
end
