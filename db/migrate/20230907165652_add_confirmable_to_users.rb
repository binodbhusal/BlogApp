class AddConfirmableToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_users, :confirmed_at, :datetime
    add_column :blog_users, :confirmation_token, :string
    add_column :blog_users, :confirmation_sent_at, :datetime
    add_column :blog_users, :unconfirmed_email, :string
  end
end
