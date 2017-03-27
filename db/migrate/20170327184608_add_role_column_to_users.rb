class AddRoleColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :is_admin
    add_column :users, :role, :integer, default: 0
  end
end