class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer, default: 0, null: false
    User.all.each do |user|
      user.update(role: User.roles[:simple_user])
    end
  end
end
