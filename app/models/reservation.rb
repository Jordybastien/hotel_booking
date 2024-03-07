class Reservation < ApplicationRecord
  DEFAULT_ARRIVAL_DATE = Date.today
  DEFAULT_DEPARTURE_DATE = DEFAULT_ARRIVAL_DATE + 1.day

  has_many :room_reservations
  has_many :rooms, through: :room_reservations

  validates :first_name, :last_name, :phone, :email, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :arrival_date, :departure_date, presence: true
  validates :number_of_rooms, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :available_rooms?
  validate :departure_after_arrival?
  validate :arrival_date_in_the_past?

  accepts_nested_attributes_for :room_reservations

  scope :placed_between, ->(arrival_date = DEFAULT_ARRIVAL_DATE, departure_date = DEFAULT_DEPARTURE_DATE) {
    where(
      'arrival_date < :departure_date AND departure_date > :arrival_date',
      arrival_date: arrival_date,
      departure_date: departure_date
    )
  }

  private

  def available_rooms?
    # In another world we'd need to rely on rooms bookability(dates) but here we're keeping it simple and relying on number_of_rooms as it will be reduced on a successfull reservation.
    return if number_of_rooms <= hotel.number_of_rooms

    errors.add(:number_of_rooms, "are not available in this hotel, you can only have #{hotel.number_of_rooms} rooms")
  end

  def departure_after_arrival?
    errors.add(:departure_date, 'must be after arrival date') if departure_date < arrival_date
  end

  def arrival_date_in_the_past?
    errors.add(:arrival_date, 'can not be in the past') if arrival_date < Date.today
  end
end
