class HotelsController < ApplicationController
  include Filterable

  def index
    # TODO: Add infinite-scroll pagination later on
    @hotels = Hotel.bookable.order(price: :asc)

    @hotels = @hotels.by_city(filter_params[:city]) if filter_params[:city].present?
    @hotels = @hotels.by_price(filter_params[:price]) if filter_params[:price].present?
    @hotels = @hotels.with_rooms(filter_params[:rooms_count]) if filter_params[:rooms_count].present?
  end
end
