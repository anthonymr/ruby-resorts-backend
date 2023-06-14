class IncreaseRoomDetailsLength < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :description, :string, limit: 500
  end
end
