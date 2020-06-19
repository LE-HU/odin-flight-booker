class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:picked_flight])
    @num_of_passengers = params[:num_of_passengers]
    @booking = Booking.new
    @num_of_passengers.to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to flights_path
    else
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :num_of_passengers, passengers_attributes: [:name, :email])
  end
end
