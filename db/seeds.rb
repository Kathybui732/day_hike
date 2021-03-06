# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
trip_1 = Trip.create(name: "Trip 1")
trip_2 = Trip.create(name: "Trip 2")

trail_1 = Trail.create(name: "Garden of the Gods", address: "123 Hike Trail", length: 2)
trail_2 = Trail.create(name: "Incline", address: "123 Hike Trail", length: 3)
trail_3 = Trail.create(name: "Devil's Thumb", address: "123 Hike Trail", length: 4)

TripTrail.create(trip: trip_1, trail: trail_1)
TripTrail.create(trip: trip_1, trail: trail_2)
TripTrail.create(trip: trip_2, trail: trail_1)
TripTrail.create(trip: trip_2, trail: trail_3)
