class RemoveImageUrlFromRoomsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :image_url
  end
end
