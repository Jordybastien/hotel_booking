class HotelsController < ApplicationController
  include Filterable

  def index
    # TODO: Add infinite-scroll pagination later on
  end

  def index_lazy
    arrival_date = filter_params[:arrival_date].presence || Reservation::DEFAULT_ARRIVAL_DATE
    departure_date = filter_params[:departure_date].presence || Reservation::DEFAULT_DEPARTURE_DATE
    number_of_rooms = filter_params[:number_of_rooms].presence || Hotel::MIN_ROOM_COUNT

    @hotels = Hotel.with_available_rooms(number_of_rooms, arrival_date, departure_date).order(price_per_room: :asc)

    @hotels = @hotels.by_price(filter_params[:price]) if filter_params[:price].present?
  end
end
