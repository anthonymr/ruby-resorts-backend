class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, limit: 55
      t.string :description, null: false, limit: 55
      t.decimal :full_price, null: false, precision: 10, scale: 2
      t.decimal :reservation_price, null: false, precision: 10, scale: 2
      t.decimal :reservation_fee, null: false, precision: 10, scale: 2
      t.integer :rating

      t.timestamps
    end
  end
end
