class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_users, :role, :string
  end
end
