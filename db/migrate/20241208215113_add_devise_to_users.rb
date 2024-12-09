class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      # Only change column types if they don't match what Devise expects
      change_column :users, :email, :string, null: false, default: "" unless column_exists?(:users, :email)
      change_column :users, :reset_password_sent_at, :datetime unless column_exists?(:users, :reset_password_sent_at)
      change_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)
      
      # Add missing Devise-related fields if not already present
      add_column :users, :encrypted_password, :string, null: false, default: "" unless column_exists?(:users, :encrypted_password)
      
      # Add missing indices
      add_index :users, :email, unique: true unless index_exists?(:users, :email)
      add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    end
  end
end
