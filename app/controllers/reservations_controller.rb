class ReservationsController < ApplicationController
  include Filterable

  before_action :set_hotel
  before_action :set_reservation

  def new
    return if @reservation.persisted?

    @reservation.attributes = {
      arrival_date: filter_params[:arrival_date],
      departure_date: filter_params[:departure_date],
      number_of_rooms: filter_params[:rooms_count]
    }
  end

  def create
    @reservation.attributes = reservation_params.merge(hotel: @hotel)

    ActiveRecord::Base.transaction do
      if @reservation.save
        @hotel.update!(number_of_rooms: @hotel.number_of_rooms - @reservation.number_of_rooms)
        render turbo_stream: turbo_stream.replace("success_modal", partial: "reservations/success_modal")
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_reservation
    @reservation ||= Reservation.new
  end

  def reservation_params
    params.require(:reservation).permit(:first_name, :last_name, :phone, :email, :hotel_id, :arrival_date, :departure_date, :number_of_rooms)
  end
end
