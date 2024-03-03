class Hotel < ApplicationRecord
  # has_many :rooms
  has_many :reservations, dependent: :destroy

  scope :bookable, -> { where('number_of_rooms > 0') }
  scope :by_city, ->(city) { where(city: city) }
  scope :by_price, ->(price) { where('price <= ?', price) }
  scope :with_rooms, ->(rooms_count) { where('number_of_rooms >= ?', rooms_count) }

  def bookable?
    number_of_rooms.positive?
  end
end
