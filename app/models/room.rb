class Room < ApplicationRecord
  enum room_type: { standard: 'standard', deluxe: 'deluxe', suite: 'suite', double: 'double', king_size: 'king_size' }

  belongs_to :hotel
  has_many :room_reservations
  has_many :reservations, through: :room_reservations

  scope :available_between, ->(arrival_date, departure_date) { where.not(booked_until: arrival_date...departure_date) }

  def book(until_date)
    update(booked_until: until_date)
  end

  def bookable?
    booked_until.nil? || booked_until <= Time.current
  end
end
