class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :username, unique: true, null: false
      t.string :email, unique: true, null: false
      t.string :role, null: false, default: 'user'
      t.string :Password_digest

      t.timestamps
    end
  end
end
