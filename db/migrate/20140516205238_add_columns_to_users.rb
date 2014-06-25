class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :fullname, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :string
    remove_column :users, :password
	remove_column :users, :password_confirmation
  end
end
