class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.integer :price, null: false
      t.datetime :booked_until

      t.timestamps
    end

    add_index :rooms, [:hotel_id, :booked_until, :price]
  end
end
