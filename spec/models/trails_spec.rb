require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe "relationships" do
    it { should have_many(:trips).through(:trip_trails) }
    it { should have_many(:trip_trails) }
  end

  describe "methods" do
    before :each do
      @trip_1 = Trip.create(name: "Trip 1")
      @trail_1 = Trail.create(name: "Garden of the Gods", address: "123 Hike Trail", length: 2)
      @trail_2 = Trail.create(name: "Incline", address: "123 Hike Trail", length: 3)
      TripTrail.create(trip: @trip_1, trail: @trail_1)
      TripTrail.create(trip: @trip_1, trail: @trail_2)
    end

    it "#total_distance" do
      expect(Trail.total_distance).to eq(5)
    end

    it "#average_distance" do
      expect(Trail.average_distance).to eq(2.5)
    end
  end
end
