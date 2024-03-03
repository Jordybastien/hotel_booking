class CreateReservation < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.references :hotel, null: false, foreign_key: true
      t.date :arrival_date, null: false
      t.date :departure_date, null: false
      t.integer :number_of_rooms, null: false
      t.timestamps
    end
  end
end
