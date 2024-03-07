class AlterRoomsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :booked_until
    add_column :rooms, :room_type, :string
  end
end
