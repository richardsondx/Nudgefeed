class CreateNudges < ActiveRecord::Migration
  def change
    create_table :nudges do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
