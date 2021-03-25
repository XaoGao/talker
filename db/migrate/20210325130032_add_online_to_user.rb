class AddOnlineToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :online, :boolean, default: false, null: false

    User.all.each do |u|
      u.update(online: false)
    end
  end
end
