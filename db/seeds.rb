# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create(code: "NYC")
Airport.create(code: "SFO")
Airport.create(code: "WRS")
Airport.create(code: "KRK")
Airport.create(code: "DTW")
Airport.create(code: "ARZ")

6.times do
  Flight.create(start_airport_id: rand(1..3),
                finish_airport_id: rand(4..6),
                start_datetime: Time.now,
                flight_duration_in_seconds: rand(1..20000))
end

Flight.create(start_airport_id: 1,
              finish_airport_id: 2,
              start_datetime: Time.now,
              flight_duration_in_seconds: 5000)
