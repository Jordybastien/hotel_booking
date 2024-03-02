class HotelsController < ApplicationController
  def index
    # TODO: Add infinite-scroll pagination later on
    @hotels = Hotel.bookable.order(price: :asc)

    @hotels = @hotels.by_city(filter_params[:city]) if filter_params[:city].present?
    @hotels = @hotels.by_price(filter_params[:price]) if filter_params[:price].present?
    @hotels = @hotels.with_rooms(filter_params[:rooms_count]) if filter_params[:rooms_count].present?
  end

  def show
    @hotel = Hotel.find(params[:id])
    default_params = filter_params

    @default_check_in = default_params[:check_in] if default_params.key?(:check_in)
    @default_check_out = default_params[:check_out] if default_params.key?(:check_out)
    @default_rooms_count = default_params[:rooms_count] if default_params.key?(:rooms_count)
  end

  private

  def filter_params
    params.fetch(:filter, {}).permit(:check_in, :check_out, :rooms_count, :price)
  end
end
