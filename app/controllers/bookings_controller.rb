class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
    @passengers = @booking.passengers
    @from_airport = @flight.from_airport.code
    @to_airport = @flight.to_airport.code
  end

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
    @user = @booking.passengers.first

    if @booking.save
      PassengerMailer.with(user: @user).welcome_email.deliver_now
      redirect_to booking_path(@booking)
    else
      render "new"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :num_of_passengers, passengers_attributes: [:name, :email])
  end
end
