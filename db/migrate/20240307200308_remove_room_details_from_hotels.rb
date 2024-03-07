class RemoveRoomDetailsFromHotels < ActiveRecord::Migration[7.0]
  def change
    remove_column :hotels, :number_of_rooms
    remove_column :hotels, :price
  end
end
