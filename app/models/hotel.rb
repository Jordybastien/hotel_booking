class Hotel < ApplicationRecord
  has_many :rooms

  MIN_ROOM_COUNT = 1

  scope :by_price, ->(price) { where('price_per_room <= ?', price) }

  scope :with_available_rooms, ->(rooms_count = MIN_ROOM_COUNT, arrival_date = Reservation::DEFAULT_ARRIVAL_DATE, departure_date = Reservation::DEFAULT_DEPARTURE_DATE) {
    joins(:rooms).merge(Room.available_between(arrival_date, departure_date)).group('hotels.id').having('count(rooms.id) >= ?', rooms_count)
  }

  def number_of_rooms(arrival_date = Reservation::DEFAULT_ARRIVAL_DATE, departure_date = Reservation::DEFAULT_DEPARTURE_DATE)
    return rooms.count if arrival_date.nil? || departure_date.nil?

    rooms.available_between(arrival_date, departure_date).count
  end

  def available_rooms(arrival_date = Reservation::DEFAULT_ARRIVAL_DATE, departure_date = Reservation::DEFAULT_DEPARTURE_DATE, number_of_rooms = nil)
    rooms.available_between(arrival_date, departure_date).limit(number_of_rooms || MIN_ROOM_COUNT)
  end
end
