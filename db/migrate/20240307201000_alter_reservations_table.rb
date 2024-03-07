class AlterReservationsTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reservations, :hotel, index: true, foreign_key: true
    remove_column :reservations, :number_of_rooms
    add_column :reservations, :is_paid, :boolean, default: false
  end
end
