class Room < ApplicationRecord
  belongs_to :hotel

  scope :available_between, ->(arrival_date, departure_date) { where.not(booked_until: arrival_date...departure_date) }

  def book(until_date)
    update(booked_until: until_date)
  end

  def bookable?
    booked_until.nil? || booked_until <= Time.current
  end
end
