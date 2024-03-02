class AddRoomsToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :image_url, :string
    add_column :hotels, :number_of_rooms, :integer
    add_column :hotels, :price, :integer
  end
end
