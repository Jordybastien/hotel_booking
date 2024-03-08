class HotelsController < ApplicationController
  include Filterable

  before_action :set_default_params

  def index
    # TODO: Add infinite-scroll pagination later on
  end

  def index_lazy
    @hotels = Hotel.with_rooms
    .available_between(@arrival_date, @departure_date)
    .having_min_rooms(@number_of_rooms)
    .select_hotel_with_rooms_count

    @hotels = @hotels.by_price(filter_params[:price]) if filter_params[:price].present?
  end

  private 
  
  def set_default_params
    @arrival_date = filter_params[:arrival_date]
    @departure_date = filter_params[:departure_date]
    @number_of_rooms = filter_params[:number_of_rooms]
    @price = filter_params[:price]
  end
end
