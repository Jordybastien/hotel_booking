class AddPricePerRoomToHotel < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :price_per_room, :integer
  end
end
