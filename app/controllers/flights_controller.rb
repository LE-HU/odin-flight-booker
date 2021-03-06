class FlightsController < ApplicationController
  def index
    @flights = Flight.where(["start_airport_id = ? and finish_airport_id = ?",
                             params[:from_query],
                             params[:to_query]])
    @passenger_array = [["1", 1], ["2", 2], ["3", 3], ["4", 4]]
    @departure_date = Flight.distinct.pluck(:start_datetime)
  end

  def flight_params
    params.require(:flight).permit(:start_airport_id,
                                   :finish_airport_id,
                                   :start_datetime,
                                   :flight,
                                   :from_query,
                                   :to_query)
  end
end
