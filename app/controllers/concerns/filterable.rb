module Filterable
  extend ActiveSupport::Concern

  FILTER_PARAMS = [:arrival_date, :departure_date, :number_of_rooms, :price].freeze

  def filter_params
    params.fetch(:filter, {}).permit(*FILTER_PARAMS).reverse_merge(
      arrival_date: Reservation::DEFAULT_ARRIVAL_DATE,
      departure_date: Reservation::DEFAULT_DEPARTURE_DATE,
      number_of_rooms: Reservation::MIN_ROOM_COUNT,
      price: nil
    )
  end
end
