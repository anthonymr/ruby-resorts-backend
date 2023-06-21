class FixPasswordColunm < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Password_digest, :password_digest
    add_column :users, :password, :string
  end
end
