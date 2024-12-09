class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :comments_count
      t.string :encrypted_password
      t.integer :likes_count
      t.boolean :private
      t.datetime :remember_created_at, precision: 6
      t.datetime :reset_password_sent_at, precision: 6
      t.string :reset_password_token
      t.string :username

      t.timestamps
    end
  end
end
