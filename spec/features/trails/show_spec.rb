require "rails_helper"

RSpec.describe "Trail's Show Page" do
	before :each do
    @trip_1 = Trip.create(name: "Trip 1")
    @trip_2 = Trip.create(name: "Trip 2")

    @trail_1 = Trail.create(name: "Garden of the Gods", address: "123 Hike Trail", length: 2)
    @trail_2 = Trail.create(name: "Incline", address: "123 Hike Trail", length: 3)
    @trail_3 = Trail.create(name: "Devil's Thumb", address: "123 Hike Trail", length: 4)

    TripTrail.create(trip: @trip_1, trail: @trail_1)
    TripTrail.create(trip: @trip_1, trail: @trail_2)
    TripTrail.create(trip: @trip_2, trail: @trail_1)
    TripTrail.create(trip: @trip_2, trail: @trail_3)
	end

  it "the name and address of this trail" do
    visit "/trails/#{@trail_1.id}"
    expect(page).to have_content("#{@trail_1.name}")
    expect(page).to have_content("#{@trail_1.address}")
  end

  it "displays the name and total length of every hiking trip that includes this trail" do
    visit "/trails/#{@trail_1.id}"
    within(".trips-#{@trip_1.id}") do
      expect(page).to have_content("#{@trip_1.name}")
      expect(page).to have_content("Total Length: 5")
    end

    within(".trips-#{@trip_2.id}") do
      expect(page).to have_content("#{@trip_2.name}")
      expect(page).to have_content("Total Length: 6")
    end
  end
end
