class AddUserIdColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_column :users, :topics, :text
    add_column :topics, :nudges, :integer
  end
end
