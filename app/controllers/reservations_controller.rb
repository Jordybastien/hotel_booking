class ReservationsController < ApplicationController
  include Filterable

  before_action :set_hotel
  before_action :set_reservation

  def new
  end

  def create
    @reservation.attributes = reservation_params.merge(
      arrival_date: @arrival_date,
      departure_date: @departure_date
    )
    ActiveRecord::Base.transaction do
      if @reservation.save
        render turbo_stream: turbo_stream.replace("success_modal", partial: "reservations/success_modal")
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def filter_rooms
    if @number_of_rooms <= @available_rooms_for_reservation.count
      render turbo_stream: [
        turbo_stream.update(:requested_rooms_info, partial: "reservations/requested_rooms", locals: { rooms: @available_rooms_for_reservation, total_price: @total_price }),
        turbo_stream.update(:requested_rooms_form, partial: "reservations/form", locals: { rooms: @available_rooms_for_reservation }),
      ]
    else
      render turbo_stream: turbo_stream.replace("unavailable_rooms", partial: "reservations/unavailable_rooms_modal")
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
    @arrival_date = filter_params[:arrival_date]
    @departure_date = filter_params[:departure_date]
    @number_of_rooms = filter_params[:number_of_rooms]&.to_i

    # All rooms in a hotel have the same price so we're okay
    @available_rooms_for_reservation = @hotel.available_rooms(@arrival_date, @departure_date, @number_of_rooms)
    @total_price = @hotel.price_per_room * @available_rooms_for_reservation.count
  end

  def set_reservation
    @reservation ||= Reservation.new
  end

  def reservation_params
    params.require(:reservation).permit(:first_name, :last_name, :phone, :email, :arrival_date, :departure_date, room_ids: [])
  end
end
