class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :message
      t.integer :nudges
      t.integer :topic_id
      t.string :topic_name
      t.integer :user_id

      t.timestamps
    end
  end
end
