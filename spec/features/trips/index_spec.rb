require "rails_helper"

RSpec.describe "Trip Index Page" do
	before :each do
    @trip_1 = Trip.create(name: "Trip 1")
    @trip_2 = Trip.create(name: "Trip 2")
    @trail_1 = Trail.create(name: "Garden of the Gods", address: "123 Hike Trail", length: 2)
    @trail_2 = Trail.create(name: "Incline", address: "123 Hike Trail", length: 3)
    TripTrail.create(trip: @trip_1, trail: @trail_1)
    TripTrail.create(trip: @trip_1, trail: @trail_2)
	end

  it "displays a list of all hiking trip names in the database." do
    visit "/trips"
    expect(page).to have_content(@trip_1.name)
    expect(page).to have_content(@trip_2.name)
  end
end
