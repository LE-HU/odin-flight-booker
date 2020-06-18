class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:picked_flight])
  end
end
