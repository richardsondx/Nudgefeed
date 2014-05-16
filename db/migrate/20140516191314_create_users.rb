class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :password
      t.string :password_confirmation
      t.string :email
      t.integer :nudges
      t.text :posts
      t.text :friends
      t.integer :nudge_requirement

      t.timestamps
    end
  end
end
