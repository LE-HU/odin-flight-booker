class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport", foreign_key: "start_airport_id"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "finish_airport_id"

  def self.search(query)
    if query
      airport_by_code = Airport.find_by(code: query)
      if airport_by_code
        self.where(from_airport: airport_by_code.id)
      else
        Flight.all
      end
    else
      Flight.all
    end
  end
end
