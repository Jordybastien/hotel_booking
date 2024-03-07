# app/models/room_reservation.rb
class RoomReservation < ApplicationRecord
  belongs_to :room
  belongs_to :reservation

  validates :room_id, presence: true
  validates :reservation_id, presence: true

  delegate :arrival_date, :departure_date, to: :reservation

  scope :placed_between, ->(arrival_date = Reservation::DEFAULT_ARRIVAL_DATE, departure_date = Reservation::DEFAULT_DEPARTURE_DATE) {
    joins(:reservation).merge(Reservation.placed_between(arrival_date, departure_date))
  }
end
