class Hotel < ApplicationRecord
  has_many :rooms

  scope :by_price, ->(price) { where('price_per_room <= ?', price) }

  scope :with_rooms, -> { joins(:rooms).order(price_per_room: :asc) }
  scope :available_between, ->(arrival_date, departure_date) { merge(Room.available_between(arrival_date, departure_date)).group('hotels.id') }
  scope :having_min_rooms, ->(rooms_count) { having('count(rooms.id) >= ?', rooms_count) }
  scope :select_hotel_with_rooms_count, -> { select('hotels.*, count(rooms.id) as available_number_of_rooms') }
  # add sorting price_per_room asc and desc

  def available_rooms(arrival_date = Reservation::DEFAULT_ARRIVAL_DATE, departure_date = Reservation::DEFAULT_DEPARTURE_DATE, number_of_rooms = nil)
    rooms.available_between(arrival_date, departure_date).limit(number_of_rooms || Reservation::MIN_ROOM_COUNT)
  end
end
