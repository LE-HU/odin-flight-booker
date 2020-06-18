class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport", foreign_key: "start_airport_id"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "finish_airport_id"

  # def self.search(from_query, to_query)
  #   if from_query && to_query
  #     from_airport = Airport.find_by(code: from_query)
  #     to_airport = Airport.find_by(code: to_query)
  #     if from_airport && to_airport
  #       self.where(from_airport: from_airport.id, to_airport: to_airport.id)
  #     else
  #       Flight.all
  #     end
  #   else
  #     Flight.all
  #   end
  # end
end
