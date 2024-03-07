class Room < ApplicationRecord
  enum room_type: { standard: 'standard', deluxe: 'deluxe', suite: 'suite', double: 'double', king_size: 'king_size' }

  belongs_to :hotel
  has_many :room_reservations
  has_many :reservations, through: :room_reservations

  scope :available_between, ->(arrival_date = Reservation::DEFAULT_ARRIVAL_DATE, departure_date = Reservation::DEFAULT_DEPARTURE_DATE) {
    where.not(
      id: RoomReservation.placed_between(arrival_date, departure_date).pluck(:room_id)
    )
  }
end
