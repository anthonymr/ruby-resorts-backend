class AddAmountToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :amount, :decimal, precision: 10, scale: 2
  end
end
