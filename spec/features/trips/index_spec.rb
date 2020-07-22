require "rails_helper"

RSpec.describe "Trip Index Page" do
	before :each do
    @trip_1 = Trip.create(name: "Trip 1")
    @trip_2 = Trip.create(name: "Trip 2")
	end

  it "displays a list of all hiking trip names in the database." do
    visit "/trips"
    expect(page).to have_content(@trip_1.name)
    expect(page).to have_content(@trip_2.name)
  end

  it "can click on the name of a hiking trip, linking to a unique page for that hiking trip." do
    visit "/trips"
    click_on "#{@trip_1.name}"
    expect(current_path).to eq("/trips/#{@trip_1.id}")
  end
end
