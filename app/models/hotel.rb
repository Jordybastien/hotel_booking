class Hotel < ApplicationRecord
  has_many :rooms

  scope :by_city, ->(city) { where(city: city) }
end
