require "rails_helper"

RSpec.describe "Trip Show Page" do
	before :each do
    @trip_1 = Trip.create(name: "Trip 1")
    @trail_1 = Trail.create(name: "Garden of the Gods", address: "123 Hike Trail", length: 2)
    @trail_2 = Trail.create(name: "Incline", address: "123 Hike Trail", length: 3)
    TripTrail.create(trip: @trip_1, trail: @trail_1)
    TripTrail.create(trip: @trip_1, trail: @trail_2)
	end

  it "a list of trails included in the trip" do
    visit "/trips/#{@trip_1.id}"
    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_2.name)
  end

  it "displays the name, address, and length for each trail" do
    visit "/trips/#{@trip_1.id}"
    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_2.name)
    expect(page).to have_content(@trail_1.address)
    expect(page).to have_content(@trail_2.address)
    expect(page).to have_content(@trail_1.length)
    expect(page).to have_content(@trail_2.length)
  end

  it "displays the total hiking distance of all trails on that hiking trip" do
    visit "/trips/#{@trip_1.id}"
    expect(page).to have_content("Total Trip Distance: 5")
  end

  it "displays the average hiking distance of all trails on that hiking trip" do
    visit "/trips/#{@trip_1.id}"
    expect(page).to have_content("Average Distance: 2.5")
  end
end
