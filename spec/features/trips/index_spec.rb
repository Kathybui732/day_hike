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
end
